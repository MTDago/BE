require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :product_name => "MyString",
      :product_price => 1.5,
      :product_description => "MyText",
      :product_image => "MyString",
      :product_duration => "MyString",
      :order_status => "MyString",
      :user_name => "MyString"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[product_name]"

      assert_select "input[name=?]", "listing[product_price]"

      assert_select "textarea[name=?]", "listing[product_description]"

      assert_select "input[name=?]", "listing[product_image]"

      assert_select "input[name=?]", "listing[product_duration]"

      assert_select "input[name=?]", "listing[order_status]"

      assert_select "input[name=?]", "listing[user_name]"
    end
  end
end
