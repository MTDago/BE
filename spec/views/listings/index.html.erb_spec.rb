require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :title => "Title",
        :description => "MyText",
        :price => "Price",
        :image => "Image",
        :status => "Status"
      ),
      Listing.create!(
        :title => "Title",
        :description => "MyText",
        :price => "Price",
        :image => "Image",
        :status => "Status"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
