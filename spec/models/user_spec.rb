require 'spec_helper'

describe User do
  
  before :all  do
    @user= User.new( code:'test_1', name:'Test_1' )

    class User
      def days_from_origination; 75; end
      def loan_type; "conforming"; end
    end
    @deal= Deal.new(combined_ltv_ratio_percent:100, ltv:95
  end

  describe '#apply_to' do
    it 'should fail days from origination' do
      @deal.apply_to @wh_l == false
    end
  end

end
