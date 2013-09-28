require 'spec_helper'

describe "deals/new" do
  before(:each) do
    assign(:deal, stub_model(Deal,
      :owner_id => 1,
      :combined_ltv_ratio_percent => 1.5,
      :home_equity_combined_ltv_ratio_percent => 1.5,
      :available_lines => "MyText"
    ).as_new_record)
  end

  it "renders new deal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deals_path, "post" do
      assert_select "input#deal_owner_id[name=?]", "deal[owner_id]"
      assert_select "input#deal_combined_ltv_ratio_percent[name=?]", "deal[combined_ltv_ratio_percent]"
      assert_select "input#deal_home_equity_combined_ltv_ratio_percent[name=?]", "deal[home_equity_combined_ltv_ratio_percent]"
      assert_select "textarea#deal_available_lines[name=?]", "deal[available_lines]"
    end
  end
end
