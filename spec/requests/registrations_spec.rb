require "spec_helper"
include Capybara::DSL

describe "Users", :js => true do
  it "allows users(hopefully soon) to move deals to different warehouse lines" do
    binding.pry
    user = create(:user, :with_user_authentications)
    
    visit root_path
    response.status.should be(200)
    # self.status_code.should eq :ok
    # get deals_path
    # ap self.methods.sort
    # response.status.should be(200)
    page.select("baml", :from => "Select Line")
    fill_in "amount_to_move", :with => "1000001"
    find('#amount_to_move').native.send_keys(:return)
    find('.baml_money').text.should eq "$1,000,000.00"
  end
  it "works! (now write some real specs)" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get deals_path
    response.status.should be(200)
  end
end
