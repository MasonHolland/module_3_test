class SearchController < ApplicationController

  def index
    # conn = Faraday.new("https://api.bestbuy.com")
    # response = conn.get do |req|
    #   req.url "/v1/stores(area(80202,25))?format=json&show=longName,city,storeType,phone,distance&pageSize=10&apiKey=#{ENV['bb_api_key']}"
    # end
    @stores_presenter = StoresPresenter.new(params[:search])
  end

end
