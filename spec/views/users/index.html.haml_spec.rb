require 'spec_helper'

describe "deals/index" do
  before(:each) do
    assign(:deals, [
      stub_model(Deal,
        :owner_id => 1,
        :combined_ltv_ratio_percent => 1.5,
        :home_equity_combined_ltv_ratio_percent => 1.5,
        :available_lines => "MyText"
      ),
      stub_model(Deal,
        :owner_id => 1,
        :combined_ltv_ratio_percent => 1.5,
        :home_equity_combined_ltv_ratio_percent => 1.5,
        :available_lines => "MyText"
      )
    ])
  end

  it "renders a list of deals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
