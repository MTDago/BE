require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :user_name => "User Name",
      :password => "Password",
      :rating => 2.5,
      :postcode => 3,
      :phone => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
