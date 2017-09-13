class Store
  attr_reader :name, :city, :distance, :phone, :type
  def initialize(attrs)
    @name     = attrs["longName"]
    @city     = attrs["city"]
    @distance = attrs["distance"]
    @phone    = attrs["phone"]
    @type     = attrs["storeType"]
  end
end
