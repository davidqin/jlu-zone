require 'spec_helper'

describe "routing" do
  it "routes to #index" do
    get("/").should route_to("wiki#index")
  end
end

describe "entry routing" do
  it "routes to entry #index" do
    get("/ktv/entries").should route_to("entries#index", :category_number => "ktv")
  end

  it "routes to entry #edit" do
    get("/entries/1/edit").should route_to("entries#edit", :id => "1")
  end

  it "routes to entry #show" do
    get("/entries/1").should route_to("entries#show", :id => "1")
  end

  it "routes to entry #create" do
    post("/entries").should route_to("entries#create")
  end
end
