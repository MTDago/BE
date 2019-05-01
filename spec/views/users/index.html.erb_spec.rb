require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :user_name => "User Name",
        :password => "Password",
        :rating => 2.5,
        :postcode => 3,
        :phone => 4
      ),
      User.create!(
        :email => "Email",
        :user_name => "User Name",
        :password => "Password",
        :rating => 2.5,
        :postcode => 3,
        :phone => 4
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
