require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :user_name => "MyString",
      :password => "MyString",
      :rating => 1.5,
      :postcode => 1,
      :phone => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[rating]"

      assert_select "input[name=?]", "user[postcode]"

      assert_select "input[name=?]", "user[phone]"
    end
  end
end
