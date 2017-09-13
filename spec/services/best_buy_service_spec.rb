RSpec.describe BestBuyService do
  context '.stores' do
    it 'returns array of stores found' do
      VCR.use_cassette('BestBuyService.store_search') do
        raw_stores = BestBuyService.store_search("80202")

        expect(raw_stores).to be_an Array
        raw_store = raw_stores.first

        expect(raw_store).to be_a Hash
        expect(raw_store).to have_key "longName"
        expect(raw_store).to have_key "city"
        expect(raw_store).to have_key "distance"
        expect(raw_store).to have_key "phone"
        expect(raw_store).to have_key "storeType"
      end
    end
  end
end
