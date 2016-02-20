FactoryGirl.define do
  factory :return_authorization_reason, class: Spree::ReturnAuthorizationReason do
    sequence(:name) { |n| "Defect ##{n}" }
  end
end
