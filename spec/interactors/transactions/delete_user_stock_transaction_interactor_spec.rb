require 'rails_helper'

RSpec.describe Transactions::DeleteUserStockTransactionInteractor do
  let(:user_stock_transaction_id) { SecureRandom.uuid }
  let(:user_stock_transaction) { FactoryBot.build(:user_stock_transaction) }

  subject(:context) {
    Transactions::DeleteUserStockTransactionInteractor.call(user_stock_transaction_id: user_stock_transaction_id)
  }

  describe '.call' do
    context 'when the database has a matching record' do
      before(:each) do
        allow(UserStockTransaction).to receive(:delete).with(user_stock_transaction_id).and_return(1)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end
    end

    context 'when the database does not have a matching record' do
      before(:each) do
        allow(UserStockTransaction).to receive(:delete).with(user_stock_transaction_id).and_return(0)
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
