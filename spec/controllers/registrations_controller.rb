require 'spec_helper'
require "cancan/matchers"

describe RegistrationsController do

  let :valid_attributes do
    {
      :owner_id                               => 1,
      :combined_ltv_ratio_percent             => 75.0,
      :home_equity_combined_ltv_ratio_percent => nil,
      :available_lines                        => [1, 4, 5]
    }
  end

   let(:valid_session) { {} }


  describe "GET index to show all non placement_intent deals" do

    context 'success' do
    
      it "should show all campaigns if current_user" do
        # deal_with_intent = FactoryGirl.create(:deal, :with_placement_intent)
        deal = FactoryGirl.create(:deal)
        get :index, :format => :html
        response.should be_success
        # hash = { :body => response.body, :status => 200, 
        #   :type => "success", 
        #   :root => "campaigns", :model => campaign, 
        #   :model_type => :first_id }

        # response_valid?(hash)

      end
    end
  end

  describe "GET show" do
    it "assigns the requested deal as @deal" do
      deal = Deal.create! valid_attributes
      get :show, {:id => deal.to_param}, valid_session
      assigns(:deal).should eq(deal)
    end
  end

  describe "GET new" do
    it "assigns a new deal as @deal" do
      get :new, {}, valid_session
      assigns(:deal).should be_a_new(Deal)
    end
  end

  describe "GET edit" do
    it "assigns the requested deal as @deal" do
      deal = Deal.create! valid_attributes
      get :edit, {:id => deal.to_param}, valid_session
      assigns(:deal).should eq(deal)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Deal" do
        expect {
          post :create, {:deal => valid_attributes}, valid_session
        }.to change(Deal, :count).by(1)
      end

      it "assigns a newly created deal as @deal" do
        post :create, {:deal => valid_attributes}, valid_session
        assigns(:deal).should be_a(Deal)
        assigns(:deal).should be_persisted
      end

      it "redirects to the created deal" do
        post :create, {:deal => valid_attributes}, valid_session
        response.should redirect_to(Deal.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deal as @deal" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        post :create, {:deal => { "owner_id" => "invalid value" }}, valid_session
        assigns(:deal).should be_a_new(Deal)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        post :create, {:deal => { "owner_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested deal" do
        deal = Deal.create! valid_attributes
        # Assuming there are no other deals in the database, this
        # specifies that the Deal created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Deal.any_instance.should_receive(:update_attributes).with({ "owner_id" => "1" })
        put :update, {:id => deal.to_param, :deal => { "owner_id" => "1" }}, valid_session
      end

      it "assigns the requested deal as @deal" do
        deal = Deal.create! valid_attributes
        put :update, {:id => deal.to_param, :deal => valid_attributes}, valid_session
        assigns(:deal).should eq(deal)
      end

      it "redirects to the deal" do
        deal = Deal.create! valid_attributes
        put :update, {:id => deal.to_param, :deal => valid_attributes}, valid_session
        response.should redirect_to(deal)
      end
    end

    describe "with invalid params" do
      it "assigns the deal as @deal" do
        deal = Deal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        put :update, {:id => deal.to_param, :deal => { "owner_id" => "invalid value" }}, valid_session
        assigns(:deal).should eq(deal)
      end

      it "re-renders the 'edit' template" do
        deal = Deal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        put :update, {:id => deal.to_param, :deal => { "owner_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested deal" do
      deal = Deal.create! valid_attributes
      expect {
        delete :destroy, {:id => deal.to_param}, valid_session
      }.to change(Deal, :count).by(-1)
    end

    it "redirects to the deals list" do
      deal = Deal.create! valid_attributes
      delete :destroy, {:id => deal.to_param}, valid_session
      response.should redirect_to(deals_url)
    end
  end

  describe "GET index" do
    it "assigns all deals as @deals" do
      deal = Deal.create! valid_attributes
      get :index, {}, valid_session
      assigns(:deals).should eq([deal])
    end
  end

end
