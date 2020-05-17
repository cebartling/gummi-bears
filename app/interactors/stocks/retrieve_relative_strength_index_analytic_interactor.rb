module Stocks
  class RetrieveRelativeStrengthIndexAnalyticInteractor
    include Interactor

    def call
      stock = Stock.find_by_symbol(context.symbol)
      if stock
        stock.relative_strength_index_analytics.each do |relative_strength_index_analytic|
          response_json = retrieve_events(relative_strength_index_analytic)
          key = "Technical Analysis: #{FUNCTION}"
          if (response_json.key?(key))
            entries = response_json[key]
            process_entries(entries, relative_strength_index_analytic)
          end
        end
      end
    end

    private

    FUNCTION = 'RSI'

    def retrieve_events(relative_strength_index_analytic)
      # https://www.alphavantage.co/query?function=RSI&symbol=IBM&interval=weekly&time_period=10&series_type=open&apikey=demo
      options = {
        query: {
          series_type: relative_strength_index_analytic.series_type,
          interval: relative_strength_index_analytic.interval_type,
          time_period: relative_strength_index_analytic.time_period,
          function: FUNCTION,
          symbol: context.symbol,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      unless response
        context.fail!(message: 'retrieve_relative_strength_index.failure',
                      errors: ["Unable to retrieve relative strength index analytic for symbol '#{context.symbol}'."])
      end
      response_body = response.body
      unless response_body
        context.fail!(message: 'retrieve_relative_strength_index.failure',
                      errors: ["Unable to retrieve relative strength index analytic for symbol '#{context.symbol}'."])
      end
      JSON.parse(response_body)
    end

    def process_entries(entries, relative_strength_index_analytic)
      entries.keys.each do |entry_key|
        entry = entries[entry_key]
        event_timestamp = DateTime.strptime(entry_key, '%Y-%m-%d')
        observation_value = entry[FUNCTION]
        unless RelativeStrengthIndexEntry.find_by(relative_strength_index_analytic: relative_strength_index_analytic,
                                                  event_timestamp: event_timestamp)
          RelativeStrengthIndexEntry.create!(
            relative_strength_index_analytic: relative_strength_index_analytic,
            event_timestamp: event_timestamp,
            index_value: BigDecimal(observation_value)
          )
        end
      end
    end

  end
end

