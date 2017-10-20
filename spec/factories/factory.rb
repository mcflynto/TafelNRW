FactoryGirl.define do
  factory :user do
    name "Philipp"
    email "pdoll@byom.de"
    password "test"
    admin true
  end

  factory :tafel do
    name "Essen"
    email "tafel@essen.de"
  end



  factory :address do
    street "turmstr"
    house_number "4"
    city "Essen"
    plz "45139"
    phone "717465"
    trait :tafel_address do
      addressable_type "Tafel"
    end
    trait :donator_address do
      addressable_type "Donator"
    end
    trait :transporter_address do
      addressable_type "Transporter"
    end
  end

  factory :transporter do
    name "Von A nach B"
    email "vonanachb@transport.com"
  end

  factory :donator do
    name "EdlerSpender"
    email "edlerspender@spender.com"
  end

  factory :donation do
    food "Bananen"
    amount 10
    unit "kg"
    expiry_date "Time.zone.now"
    ordered false
    delivery_date "Time.zone.now"
  end

end
