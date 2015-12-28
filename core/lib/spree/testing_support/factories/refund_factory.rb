require 'spree/testing_support/factories/payment_factory'
require 'spree/testing_support/factories/refund_reason_factory'

FactoryGirl.define do
  sequence(:refund_transaction_id) { |n| "fake-refund-transaction-#{n}"}

  factory :refund, class: Spree::Refund do
    amount 100.00
    transaction_id { generate(:refund_transaction_id) }
    association(:payment, state: 'completed')
    association(:reason, factory: :refund_reason)
  end
end
