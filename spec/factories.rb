FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "user#{n}@masinmo.com" }
    sequence(:username) {|n| "user#{n}" }
    password "password"
    password_confirmation "password"
    country "Spain"
    city "Valencia"
    first_name "Antonio"
    last_name "Morales"
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
