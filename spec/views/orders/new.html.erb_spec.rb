require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :user => nil,
      :ammount => "MyString",
      :seller => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[ammount]"

      assert_select "input[name=?]", "order[seller]"

      assert_select "input[name=?]", "order[title]"
    end
  end
end
