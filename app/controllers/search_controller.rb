class SearchController < ApplicationController

  def index
    @stores_presenter = StoresPresenter.new(params[:search])
  end

end
