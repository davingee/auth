FactoryGirl.define do
  factory :user do
     first_name               "foo"
     last_name                "bar"
     email                    "foo@bar.com"
     password                 "foo_bar"

    # Validation failed: Property can't be blank, Closing subject loan can't be blank, Current subject loan can't be blank
    # ninja_application   { |app| app.association(:ninja_application, :status => :approved) }
    # user_roles          { |roles| [roles.association(:user_role, :role => 'ninja')] }

    trait :with_user_authentication do
      user_authentications { FactoryGirl.build(:user_authentications) }
      association                 :owner
    end

    trait :with_all do 
      # property { FactoryGirl.build(:property) }
      # closing_subject_loan { FactoryGirl.build(:closing_subject_loan) }
      # current_subject_loan { FactoryGirl.build(:current_subject_loan) }
      # borrowers { |b| [b.association(:borrower)] }
    end

  end
end