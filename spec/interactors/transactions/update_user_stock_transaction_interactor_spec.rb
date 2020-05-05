require 'rails_helper'

RSpec.describe Transactions::UpdateUserStockTransactionInteractor do
  let(:user_stock_transaction_id) { SecureRandom.uuid }
  let(:price_in_cents) { 16000 }
  let(:shares_count) { 14 }
  let(:transaction_timestamp) { Time.now }
  let(:transaction_type) { :transaction_type_buy }
  let(:user_stock) { FactoryBot.build(:user_stock) }
  let(:user_stock_transaction) { FactoryBot.build(:user_stock_transaction) }

  subject(:context) {
    Transactions::UpdateUserStockTransactionInteractor.call(
      user_stock_transaction_id: user_stock_transaction_id,
      price_in_cents: price_in_cents,
      shares_count: shares_count,
      transaction_timestamp: transaction_timestamp,
      transaction_type: transaction_type
    )
  }

  describe '.call' do
    context 'when given valid parameters' do
      before(:each) do
        allow(UserStockTransaction).to receive(:find).with(user_stock_transaction_id).and_return(user_stock_transaction)
        allow(user_stock_transaction).to receive(:update).and_return(true)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the updated user stock transaction' do
        expect(context.transaction).to eq(user_stock_transaction)
      end
    end

    context 'when given invalid parameters' do
      context 'when unable to find the user stock transaction by its ID' do
        before(:each) do
          allow(UserStockTransaction).to receive(:find).with(user_stock_transaction_id).and_return(nil)
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
          allow(UserStockTransaction).to receive(:find).with(user_stock_transaction_id).and_return(user_stock_transaction)
          allow(user_stock_transaction).to receive(:update).and_return(false)
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