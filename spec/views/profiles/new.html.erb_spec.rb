require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user_name => "MyString",
      :phone => 1,
      :postcode => 1,
      :rating => 1.5,
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[user_name]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "input[name=?]", "profile[rating]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
