require 'rails_helper'

RSpec.describe Transactions::CreateUserStockTransactionInteractor do
  let(:user_stock_id) { SecureRandom.uuid }
  let(:price_in_cents) { 15000 }
  let(:shares_count) { 11 }
  let(:transaction_timestamp) { Time.now }
  let(:transaction_type) { :transaction_type_buy }
  let(:user_stock) { FactoryBot.build(:user_stock) }
  let(:user_stock_transaction) { FactoryBot.build(:user_stock_transaction) }

  subject(:context) {
    Transactions::CreateUserStockTransactionInteractor.call(
      user_stock_id: user_stock_id,
      price_in_cents: price_in_cents,
      shares_count: shares_count,
      transaction_timestamp: transaction_timestamp,
      transaction_type: transaction_type
    )
  }

  describe '.call' do
    context 'when given valid parameters' do
      before(:each) do
        allow(UserStock).to receive(:find).with(user_stock_id).and_return(user_stock)
        allow(UserStockTransaction).to receive(:create).and_return(user_stock_transaction)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the newly created user stock transaction' do
        expect(context.user_stock_transaction).to eq(user_stock_transaction)
      end
    end

    context 'when given invalid parameters' do
      context 'when unable to find the user by its ID' do
        before(:each) do
          allow(UserStock).to receive(:find).with(user_stock_id).and_return(nil)
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

      context 'when unable to save the new user stock transaction' do
        before(:each) do
          allow(UserStock).to receive(:find).with(user_stock_id).and_return(user_stock)
          allow(UserStockTransaction).to receive(:create).and_return(nil)
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