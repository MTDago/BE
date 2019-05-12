require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :user => nil,
        :ammount => "Ammount",
        :seller => "Seller",
        :title => "Title"
      ),
      Order.create!(
        :user => nil,
        :ammount => "Ammount",
        :seller => "Seller",
        :title => "Title"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ammount".to_s, :count => 2
    assert_select "tr>td", :text => "Seller".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
