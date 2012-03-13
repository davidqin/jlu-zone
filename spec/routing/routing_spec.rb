require 'spec_helper'

describe "routing" do
  it "routes to #index" do
    get("/").should route_to("home#index")
  end
end

describe "entry routing" do
  it "routes to entry #index" do
    get("wiki/category/ktv").should route_to("wiki/entries#index", :category_number => "ktv")
  end

  it "routes to entry #edit" do
    get("wiki/entries/1/edit").should route_to("wiki/entries#edit", :id => "1")
  end

  it "routes to entry #show" do
    get("wiki/entries/1").should route_to("wiki/entries#show", :id => "1")
  end

  it "routes to entry #create" do
    post("wiki/entries").should route_to("wiki/entries#create")
  end
end

describe "user routing" do
  it "routes to user #menu" do
    get("users/").should route_to("users/users#menu")
  end

  it "routes to entry #show" do
    get("/users/123").should route_to("users/users#show", :id => "123")
  end
end

