require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :user_name => "MyString",
      :password => "MyString",
      :rating => 1.5,
      :postcode => 1,
      :phone => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[rating]"

      assert_select "input[name=?]", "user[postcode]"

      assert_select "input[name=?]", "user[phone]"
    end
  end
end
