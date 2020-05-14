module Stocks
  class RetrieveSimpleMovingAverageAnalyticInteractor
    include Interactor

    def call
      stock = Stock.find_by_symbol(context.symbol)
      if stock
        stock.simple_moving_average_analytics.each do |simple_moving_average_analytic|
          response_json = retrieve_events(simple_moving_average_analytic)

          puts response_json.inspect

          timezone = retrieve_timezone(response_json)
          key = 'Technical Analysis: SMA'
          if (response_json.key?(key))
            entries = response_json[key]
            process_entries(entries, simple_moving_average_analytic)
          end
        end
      end
    end

    private

    FUNCTION = 'SMA'

    def retrieve_events(simple_moving_average_analytic)
      # https://www.alphavantage.co/query?function=SMA&symbol=IBM&interval=weekly&time_period=10&series_type=open&apikey=demo
      options = {
        query: {
          series_type: simple_moving_average_analytic.series_type,
          interval: simple_moving_average_analytic.interval_type,
          time_period: simple_moving_average_analytic.time_period,
          function: FUNCTION,
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

    def retrieve_timezone(response_json)
      result = 'US/Eastern'
      metadata_key = 'Meta Data'
      if response_json.key?(metadata_key)
        metadata = response_json[metadata_key]
        timezone_key = '7. Time Zone'
        if metadata.key?(timezone_key)
          result = metadata[timezone_key]
        end
      end
      result
    end

    def process_entries(entries, simple_moving_average_analytic)
      entries.keys.each do |entry_key|
        entry = entries[entry_key]
        # TODO: Get timezone from metadata and convert
        event_timestamp = DateTime.strptime(entry_key, '%Y-%m-%d')
        observation_value = entry[FUNCTION]
        unless SimpleMovingAverageEntry.find_by(simple_moving_average_analytic: simple_moving_average_analytic,
                                                event_timestamp: event_timestamp)
          SimpleMovingAverageEntry.create!(
            simple_moving_average_analytic: simple_moving_average_analytic,
            event_timestamp: event_timestamp,
            observation_value_in_cents: Integer(BigDecimal(observation_value) * 100)
          )
        end
      end
    end

  end
end

