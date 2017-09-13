require 'rails_helper'

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

RSpec.describe "items requests" do
  it "index returns all items" do
    item_1 = Item.create(name: "Green Pan", description: "A non stick great pan", image_url: "google.com")
    item_2 = Item.create(name: "Brown Pan", description: "A non stick great pan", image_url: "google.com")
    item_3 = Item.create(name: "Red Pan", description: "A non stick great pan", image_url: "google.com")

    get "/api/v1/items"

    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first).to have_key("id")
    expect(items.first["id"]).to eq(item_1.name)
    expect(items.first).to have_key("name")
    expect(items.first["name"]).to eq(item_1.name)
    expect(items.first).to have_key("description")
    expect(items.first["description"]).to eq(item_1.description)
    expect(items.first).to have_key("image_url")
    expect(items.first["image_url"]).to eq(item_1.image_url)
    expect(items.first).to_not have_key("created_at")
    expect(items.first).to_not have_key("updated_at")
  end

  # When I send a GET request to `/api/v1/items/1`
  # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

  it "show returns a single item" do
    item_1 = Item.create(name: "Green Pan", description: "A non stick great pan", image_url: "google.com")

    get "/api/v1/items/1"

    expect(response.status).to eq(200)

    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item["id"]).to eq(item_1.name)
    expect(item).to have_key("name")
    expect(item["name"]).to eq(item_1.name)
    expect(item).to have_key("description")
    expect(item["description"]).to eq(item_1.description)
    expect(item).to have_key("image_url")
    expect(item["image_url"]).to eq(item_1.image_url)
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted

  it "delete is success" do
    item = Item.create(name: "Green Pan", description: "A non stick great pan", image_url: "google.com")

    delete "/api/v1/items/1"

    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
  end

  # When I send a POST request to `/api/v1/items` with a name, description, and image_url
  # I receive a 201 JSON  response if the record is successfully created
  # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  it "post creates a new item" do
    item_1 = {name: "Green Pan", description: "A non stick great pan", image_url: "google.com"}

    post "/api/v1/items?name=#{item_1.name}&description=#{item_1.description}&image_url=#{item_1.image_url}"

    expect(response.status).to eq(201)

    new_item = JSON.parse(response.body)

    expect(new_item).to have_key("id")
    expect(new_item["id"]).to eq(item_1.name)
    expect(new_item).to have_key("name")
    expect(new_item["name"]).to eq(item_1.name)
    expect(new_item).to have_key("description")
    expect(new_item["description"]).to eq(item_1.description)
    expect(new_item).to have_key("image_url")
    expect(new_item["image_url"]).to eq(item_1.image_url)
    expect(new_item).to_not have_key("created_at")
    expect(new_item).to_not have_key("updated_at")
  end
end
