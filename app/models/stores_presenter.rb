class StoresPresenter
  attr_reader :zip, :stores

  def initialize(zip)
    @zip              = zip
    @best_buy_service = BestBuyService.new
    @stores           = []
    compile_stores
  end

  def compile_stores
    @stores = @best_buy_service.store_search(zip).map do |store|
      Store.new(store)
    end
  end
end
