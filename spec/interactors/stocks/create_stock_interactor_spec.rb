require 'rails_helper'

RSpec.describe Stocks::CreateStockInteractor do
  let(:stock_name) { 'Microsoft Inc.' }
  let(:stock_symbol) { 'MSFT' }
  let(:user_id) { SecureRandom.uuid }

  subject(:context) { Stocks::CreateStockInteractor.call(name: stock_name,
                                                         symbol: stock_symbol,
                                                         user_id: user_id) }

  describe '.call' do
    context 'when given valid parameters' do
      let(:stock) { FactoryBot.build(:stock) }
      let(:user) { FactoryBot.build(:user) }
      let(:user_stock) { FactoryBot.build(:user_stock) }

      context 'when stock does not already exist' do
        before(:each) do
          allow(Stock).to receive(:create!).and_return(stock)
          allow(User).to receive(:find).with(user_id).and_return(user)
          allow(UserStock).to receive(:create!).and_return(user_stock)
        end

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'provides the newly created stock' do
          expect(context.stock).to eq(stock)
        end

        it 'provides the newly created user/stock association' do
          expect(context.user_stock).to eq(user_stock)
        end

        it 'provides the existing user' do
          expect(context.user).to eq(user)
        end
      end

      context 'when stock previously exists' do
        before(:each) do
          allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(stock)
          allow(User).to receive(:find).with(user_id).and_return(user)
          allow(UserStock).to receive(:create!).and_return(user_stock)
        end

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it "provides the newly created stock" do
          expect(context.stock).to eq(stock)
        end

        it "provides the newly created user/stock association" do
          expect(context.user_stock).to eq(user_stock)
        end

        it "provides the existing user" do
          expect(context.user).to eq(user)
        end
      end
    end

    context 'when given invalid parameters' do
      let(:stock) { FactoryBot.build(:stock) }
      let(:user) { FactoryBot.build(:user) }
      let(:user_stock) { FactoryBot.build(:user_stock) }

      context 'when unable to find the user by its ID' do
        before(:each) do
          allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(stock)
          allow(User).to receive(:find).with(user_id).and_return(nil)
          allow(UserStock).to receive(:create!).and_return(user_stock)
        end

        it 'fails' do
          expect(context).to be_a_failure
        end

        it 'provides a failure message' do
          expect(context.message).to be_present
        end

        it 'provides an error array with one message' do
          expect(context.errors.length).to eq(1)
        end
      end

      context 'when unable to create the user/stock association' do
        before(:each) do
          allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(stock)
          allow(User).to receive(:find).with(user_id).and_return(user)
          allow(UserStock).to receive(:create!).and_raise('Boom')
        end

        it 'fails' do
          expect(context).to be_a_failure
        end

        it 'provides a failure message' do
          expect(context.message).to be_present
        end

        it 'provides an error array with one message' do
          expect(context.errors.length).to eq(1)
        end
      end

      context 'when unable to create the stock' do
        before(:each) do
          allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(nil)
          allow(Stock).to receive(:create!).and_raise('Boom')
        end

        it 'fails' do
          expect(context).to be_a_failure
        end

        it 'provides a failure message' do
          expect(context.message).to be_present
        end

        it 'provides an error array with one message' do
          expect(context.errors.length).to eq(1)
        end
      end
    end
  end
end
