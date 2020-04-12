require 'rails_helper'

RSpec.describe Stocks::CreateStock do
  let(:stock_name) { 'Microsoft Inc.' }
  let(:stock_symbol) { 'MSFT' }

  subject(:context) { Stocks::CreateStock.call(name: stock_name, symbol: stock_symbol) }

  describe ".call" do
    context "when given valid parameters" do
      let(:stock) { FactoryBot.build(:stock) }

      before(:each) do
        allow(Stock).to receive(:create).and_return(stock)
      end

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the newly created stock" do
        expect(context.stock).to eq(stock)
      end
    end

    context "when given invalid parameters" do
      let(:stock_name) { nil }
      let(:stock_symbol) { nil }

      before do
        allow(Stock).to receive(:create).and_return(nil)
      end

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure message" do
        expect(context.message).to be_present
      end
    end
  end
end
