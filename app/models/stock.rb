class Stock < ApplicationRecord
  
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:api_key],
      endpoint: Rails.application.credentials.iex_client[:api_url],
    )
    client.quote(ticker_symbol)
  end
end
