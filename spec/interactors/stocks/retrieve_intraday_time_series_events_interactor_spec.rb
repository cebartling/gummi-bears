require 'rails_helper'

RSpec.describe Stocks::RetrieveIntradayTimeSeriesEventsInteractor do

  let(:stock_symbol) { 'IBM' }
  let(:stock) { FactoryBot.build(:stock) }

  subject(:context) { Stocks::RetrieveIntradayTimeSeriesEventsInteractor.call(symbol: stock_symbol) }


  context 'when given valid parameters' do
    let(:response_body) { File.read('spec/interactors/stocks/time_series_intraday_response.json') }
    let(:response) { OpenStruct.new(body: response_body) }

    context 'when Alpha Vantage API responds appropriately' do
      before(:each) do
        allow(HTTParty).to receive(:get).and_return(response)
        allow(Stock).to receive(:find_by).with(symbol: stock_symbol).and_return(stock)
        allow(IntradayTimeSeriesEvent).to receive(:create!)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end
    end
  end
end
