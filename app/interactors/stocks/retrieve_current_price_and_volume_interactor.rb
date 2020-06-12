module Stocks
  class RetrieveCurrentPriceAndVolumeInteractor
    include Interactor

    def call
      response_json = retrieve_events
      key = 'Global Quote'
      if (response_json.key?(key))
        entry = response_json[key]
        stock = Stock.find_by(symbol: context.symbol)
        process_entry(entry, stock)
      end
    end

    private

    def retrieve_events
      options = {
        query: {
          function: 'GLOBAL_QUOTE',
          symbol: context.symbol,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      response_body = response.body
      unless response_body
        context.fail!(message: 'retrieve_current_price_and_volume.failure',
                      errors: ["Unable to retrieve current price and volume for symbol '#{context.symbol}'."])
      end
      JSON.parse(response_body)
    end

    def process_entry(entry, stock)
        open_str = entry['02. open']
        high_str = entry['03. high']
        low_str = entry['04. low']
        current_price_str = entry['05. price']
        volume_str = entry['06. volume']
        latest_trading_date = Date.strptime(entry['07. latest trading day'], '%Y-%m-%d')
        previous_close_str = entry['08. previous close']
        price_change_str = entry['09. change']
        percent_change_str = entry['10. change percent']
        stock.update(
          open_price: BigDecimal(open_str),
          high_price: BigDecimal(high_str),
          low_price: BigDecimal(low_str),
          current_price: BigDecimal(current_price_str),
          volume: Integer(volume_str),
          latest_trading_date: latest_trading_date,
          previous_close_price: BigDecimal(previous_close_str),
          price_change: BigDecimal(price_change_str),
          percent_change: BigDecimal(percent_change_str.chop)
        )
    end

  end
end

