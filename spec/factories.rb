FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "user#{n}@masinmo.com" }
    password "password"
    password_confirmation "password"
  end

  factory :offer do
    title "Best offer ever!"
    association :user
  end

  factory :offer_publish_ready, parent: :offer do
    country "Spain"
    city "Valencia"
    street "Av. de Blasco Ibanez"
    price 2000.0
    property_type "house"
  end

end
