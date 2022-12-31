class Stock < ApplicationRecord
  
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:api_key],
      endpoint: Rails.application.credentials.iex_client[:api_url],
    )
    quote =  client.quote(ticker_symbol)
    new(ticker: ticker_symbol, name: quote.company_name, last_price: quote.latest_price)
  end
end
