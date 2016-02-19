require 'spree/testing_support/factories/calculator_factory'
require 'spree/testing_support/factories/shipping_category_factory'
require 'spree/testing_support/factories/zone_factory'

FactoryGirl.define do
  factory(
    :shipping_method,
    aliases: [
      :base_shipping_method
    ],
    class: Spree::ShippingMethod
  ) do
    association(:calculator, factory: :shipping_calculator, strategy: :build)

    zones do
      [Spree::Zone.find_by(name: 'GlobalZone') || FactoryGirl.create(:global_zone)]
    end

    name 'UPS Ground'
    code 'UPS_GROUND'

    before(:create) do |shipping_method, evaluator|
      if shipping_method.shipping_categories.empty?
        shipping_method.shipping_categories << (Spree::ShippingCategory.first || create(:shipping_category))
      end
    end

    factory :free_shipping_method, class: Spree::ShippingMethod do
      association(:calculator, factory: :shipping_no_amount_calculator, strategy: :build)
    end
  end
end
