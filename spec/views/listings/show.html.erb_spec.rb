require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => "Title",
      :description => "MyText",
      :price => "Price",
      :image => "Image",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Status/)
  end
end
