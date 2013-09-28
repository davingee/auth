FactoryGirl.define do
  factory :user_authentication do
     provider                 "facebook"
     uid                      "123123123"
     token                    "123123123"

    trait :with_user do
      association                 :user
    end

  end
end