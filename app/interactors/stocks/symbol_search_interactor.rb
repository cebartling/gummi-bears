module Stocks
  class SymbolSearchInteractor
    include Interactor

    def call
      response = retrieve_symbol_matches
      context.matches = []
      if response.key?('bestMatches')
        matches = response['bestMatches']
        context.matches = matches.collect { |match| OpenStruct.new(symbol: match['1. symbol'], name: match['2. name']) }
      end
    end

    private

    def retrieve_symbol_matches
      options = {
        query: {
          function: 'SYMBOL_SEARCH',
          keywords: context.keywords,
          apikey: ENV['ALPHA_VANTAGE_API_KEY'],
        },
        headers: {'Content-Type' => 'application/json'}
      }
      response = HTTParty.get('https://www.alphavantage.co/query', options)
      response_body = response.body
      unless response_body
        context.fail!(message: 'symbol_search.failure',
                      errors: ["Unable to symbol matches for keywords: '#{context.keywords}'."])
      end
      JSON.parse(response_body)
    end

  end
end
