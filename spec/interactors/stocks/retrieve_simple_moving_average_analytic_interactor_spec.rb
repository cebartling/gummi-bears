require 'rails_helper'

RSpec.describe Stocks::RetrieveSimpleMovingAverageAnalyticInteractor do

  let(:stock_symbol) { 'IBM' }
  let(:stock) { FactoryBot.build(:stock) }
  let(:simple_moving_average_analytic1) { FactoryBot.build(:simple_moving_average_analytic, stock: stock) }
  let(:simple_moving_average_analytic2) { FactoryBot.build(:simple_moving_average_analytic, stock: stock) }

  subject(:context) { Stocks::RetrieveSimpleMovingAverageAnalyticInteractor.call(symbol: stock_symbol) }

  context 'when given valid parameters' do
    let(:response_body) { File.read('spec/interactors/stocks/simple_moving_average_events_response.json') }
    let(:response) { OpenStruct.new(body: response_body) }

    context 'when Alpha Vantage API responds appropriately' do
      before(:each) do
        allow(HTTParty).to receive(:get).and_return(response)
        allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(stock)
        allow(stock).to receive(:simple_moving_average_analytics).and_return(
          [
            simple_moving_average_analytic1,
            simple_moving_average_analytic2
          ]
        )
        allow(SimpleMovingAverageEntry).to receive(:find_by).and_return(nil)
        allow(SimpleMovingAverageEntry).to receive(:create!)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end
    end
  end

end