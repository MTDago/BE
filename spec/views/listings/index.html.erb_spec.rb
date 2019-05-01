require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :product_name => "Product Name",
        :product_price => 2.5,
        :product_description => "MyText",
        :product_image => "Product Image",
        :product_duration => "Product Duration",
        :order_status => "Order Status",
        :user_name => "User Name"
      ),
      Listing.create!(
        :product_name => "Product Name",
        :product_price => 2.5,
        :product_description => "MyText",
        :product_image => "Product Image",
        :product_duration => "Product Duration",
        :order_status => "Order Status",
        :user_name => "User Name"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Product Image".to_s, :count => 2
    assert_select "tr>td", :text => "Product Duration".to_s, :count => 2
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
  end
end
