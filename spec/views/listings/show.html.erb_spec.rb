require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :product_name => "Product Name",
      :product_price => 2.5,
      :product_description => "MyText",
      :product_image => "Product Image",
      :product_duration => "Product Duration",
      :order_status => "Order Status",
      :user_name => "User Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Product Image/)
    expect(rendered).to match(/Product Duration/)
    expect(rendered).to match(/Order Status/)
    expect(rendered).to match(/User Name/)
  end
end
