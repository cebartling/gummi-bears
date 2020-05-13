module Stocks
  class RetrieveSimpleMovingAverageAnalyticInteractor
    include Interactor

    def call
      stock = Stock.find_by_symbol(context.symbol)
      if stock
        stock.simple_moving_average_analytics.each do |analytic|
          response_json = retrieve_events(analytic)

          puts response_json

          # timezone = retrieve_timezone(response_json)
          # key = 'Time Series (Daily)'
          # if (response_json.key?(key))
          #   entries = response_json[key]
          #   stock = Stock.find_by(symbol: context.symbol)
          #   process_entries(entries, stock)
          # end
        end
      end
    end

    private

    def retrieve_events(simple_moving_average_analytic)
      # https://www.alphavantage.co/query?function=SMA&symbol=IBM&interval=weekly&time_period=10&series_type=open&apikey=demo
      options = {
        query: {
          series_type: simple_moving_average_analytic.series_type,
          interval: simple_moving_average_analytic.interval_type,
          time_period: simple_moving_average_analytic.time_period,
          function: 'SMA',
          symbol: context.symbol,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      response_body = response.body
      unless response_body
        context.fail!(message: 'retrieve_simple_moving_average.failure',
                      errors: ["Unable to retrieve simple moving average analytic for symbol '#{context.symbol}'."])
      end
      JSON.parse(response_body)
    end

    # def retrieve_timezone(response_json)
    #   result = 'US/Eastern'
    #   metadata_key = 'Meta Data'
    #   if response_json.key?(metadata_key)
    #     metadata = response_json[metadata_key]
    #     timezone_key = '6. Time Zone'
    #     if metadata.key?(timezone_key)
    #       result = metadata[timezone_key]
    #     end
    #   end
    #   result
    # end
    #
    # def process_entries(entries, stock)
    #   entries.keys.each do |entry_key|
    #     entry = entries[entry_key]
    #     # TODO: Get timezone from metadata and convert
    #     event_date = DateTime.strptime(entry_key, '%Y-%m-%d')
    #     open_str = entry["1. open"]
    #     high_str = entry["2. high"]
    #     low_str = entry["3. low"]
    #     close_str = entry["4. close"]
    #     volume_str = entry["5. volume"]
    #     unless DailyTimeSeriesEvent.find_by(stock: stock, event_date: event_date)
    #       DailyTimeSeriesEvent.create!(
    #         stock: stock,
    #         event_date: event_date,
    #         open_price: BigDecimal(open_str),
    #         high_price: BigDecimal(high_str),
    #         low_price: BigDecimal(low_str),
    #         close_price: BigDecimal(close_str),
    #         volume: Integer(volume_str)
    #       )
    #     end
    #   end
    # end

  end
end

