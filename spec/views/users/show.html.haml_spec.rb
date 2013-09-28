require 'spec_helper'

describe "deals/show" do
  before(:each) do
    @deal = assign(:deal, stub_model(Deal,
      :owner_id => 1,
      :combined_ltv_ratio_percent => 1.5,
      :home_equity_combined_ltv_ratio_percent => 1.5,
      :available_lines => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
  end
end
