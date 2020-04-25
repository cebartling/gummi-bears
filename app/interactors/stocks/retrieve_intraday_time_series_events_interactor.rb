module Stocks
  class RetrieveIntradayTimeSeriesEventsInteractor
    include Interactor

    INTERVAL = '5min'

    def call
      response_json = retrieve_events
      timezone = retrieve_timezone(response_json)
      key = "Time Series (#{INTERVAL})"
      if (response_json.key?(key))
        entries = response_json[key]
        stock = Stock.find_by(symbol: context.symbol)
        process_entries(entries, stock)
      end
    end

    private

    def retrieve_events
      options = {
        query: {
          function: 'TIME_SERIES_INTRADAY',
          symbol: context.symbol,
          INTERVAL: INTERVAL,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      response_body = response.body

      unless response_body
        context.fail!(message: 'retrieve_time_series_intraday.failure',
                      errors: ["Unable to retrieve daily time series events for symbol '#{context.symbol}'."])
      end
      JSON.parse(response_body)
    end

    def retrieve_timezone(response_json)
      result = 'US/Eastern'
      metadata_key = 'Meta Data'
      if response_json.key?(metadata_key)
        metadata = response_json[metadata_key]
        timezone_key = '6. Time Zone'
        if metadata.key?(timezone_key)
          result = metadata[timezone_key]
        end
      end
      result
    end

    def process_entries(entries, stock)
      entries.keys.each do |entry_key|
        entry = entries[entry_key]
        # TODO: Get timezone from metadata and convert
        event_datetime = Time.strptime(entry_key, '%Y-%m-%d %H:%M:%S')
        open_str = entry["1. open"]
        high_str = entry["2. high"]
        low_str = entry["3. low"]
        close_str = entry["4. close"]
        volume_str = entry["5. volume"]
        unless IntradayTimeSeriesEvent.find_by(stock: stock, event_datetime: event_datetime)
          IntradayTimeSeriesEvent.create!(
            stock: stock,
            event_datetime: event_datetime,
            open_price: BigDecimal(open_str),
            high_price: BigDecimal(high_str),
            low_price: BigDecimal(low_str),
            close_price: BigDecimal(close_str),
            volume: Integer(volume_str)
          )
        end
      end
    end

  end
end

