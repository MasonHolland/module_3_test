class BestBuyService
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com")
  end

  def self.store_search(zip)
    new.store_search(zip)
  end

  def store_search(zip)
    response = conn.get do |req|
      req.url   "/v1/stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,storeType,phone,distance'
      req.params['pageSize'] = '10'
      req.params['apiKey'] = ENV['bb_api_key']
    end
    JSON.parse(response.body)["stores"]
  end

  private
    attr_reader :conn
end
