module Stocks
  class RetrieveTimeSeriesIntradayInteractor
    include Interactor

    def call
      interval = '5min'
      options = {
        query: {
          function: 'TIME_SERIES_INTRADAY',
          symbol: context.symbol,
          interval: interval,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      response_body = response.body

      unless response_body
        context.fail!(message: 'retrieve_time_series_intraday.failure',
                      errors: ["Unable to retrieve time series intraday for symbol '#{context.symbol}'."])
      end

      stock = Stock.find_by(symbol: context.symbol)
      response_json = JSON.parse(response_body)
      key = "Time Series (#{interval})"
      if (response_json.key?(key))
        entries = response_json[key]
        entries.keys.each do |entry_key|
          entry = entries[entry_key]
          # TODO: Get timezone from metadata and convert
          event_datetime = DateTime.strptime(entry_key, '%Y-%m-%d %H:%M:%S')
          open_str = entry["1. open"]
          high_str = entry["2. high"]
          low_str = entry["3. low"]
          close_str = entry["4. close"]
          volume_str = entry["5. volume"]
          IntradayTimeSeriesEvent.create!(
            stock: stock,
            event_datetime: event_datetime,
            open_price: BigDecimal(open_str),
            high_price: BigDecimal(high_str),
            low_price: BigDecimal(low_str),
            close_price: BigDecimal(close_str),
            volume: BigDecimal(volume_str)
          )
        end
      end


      # context.message = 'stock_create.success'
      # context.errors = []
      # context.stock = Stock.find_by(symbol: context.symbol)
      # unless context.stock
      #   begin
      #     context.stock = Stock.create!(name: context.name, symbol: context.symbol)
      #   rescue
      #     context.fail!(message: 'stock_create.failure',
      #                   errors: ["Unable to create stock '#{context.name}'."])
      #   end
      # end
      #
      # context.user = User.find(context.user_id)
      # unless context.user
      #   context.fail!(message: 'stock_create.failure',
      #                 errors: ["Unable to find user by identifier: [#{context.user_id}]."])
      # end
      #
      # begin
      #   context.user_stock = UserStock.create!(stock: context.stock, user: context.user)
      # rescue
      #   context.fail!(message: 'stock_create.failure', errors: ['Unable to create a new user/stock association.'])
      # end
    end
  end
end

