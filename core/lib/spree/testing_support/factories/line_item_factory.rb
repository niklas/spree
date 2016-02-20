require 'spree/testing_support/factories/order_factory'
require 'spree/testing_support/factories/product_factory'

FactoryGirl.define do
  factory :line_item, class: Spree::LineItem do
    quantity 1
    price { BigDecimal.new('10.00') }
    pre_tax_amount { price }
    order
    transient do
      association :product
    end
    variant{ product.master }
  end
end
