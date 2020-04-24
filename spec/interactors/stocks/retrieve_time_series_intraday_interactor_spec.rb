require 'rails_helper'

RSpec.describe Stocks::RetrieveTimeSeriesIntradayInteractor do

  let(:stock_symbol) { 'IBM' }

  subject(:context) { Stocks::RetrieveTimeSeriesIntradayInteractor.call(symbol: stock_symbol) }


  context 'when given valid parameters' do
    let(:response_body) { File.read('spec/interactors/stocks/time_series_intraday_response.json') }
    let(:response) { OpenStruct.new(body: response_body) }

    context 'when stock does not already exist' do
      before(:each) do
        allow(HTTParty).to receive(:get).and_return(response)
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end

      # it 'provides the newly created stock' do
      #   expect(context.stock).to eq(stock)
      # end
      #
      # it 'provides the newly created user/stock association' do
      #   expect(context.user_stock).to eq(user_stock)
      # end
      #
      # it 'provides the existing user' do
      #   expect(context.user).to eq(user)
      # end
    end
  end
end
