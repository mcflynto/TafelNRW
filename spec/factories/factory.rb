FactoryGirl.define do
  factory :user do
    name 'Philipp'
    email 'philippd@byom.de'
    password 'test'
    admin true
    salt 'asdasdastr4325234324sdfds'
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt('secret',
                     'asdasdastr4325234324sdfds')
  end

  factory :organization do
    name 'Essen'
    email 'tafelessenB@byom.de'
    factory :organization_with_share do
      after(:create) do |organization|
        create(:share, organization: organization)
      end
    end
  end

  factory :address do
    street 'turmstr'
    house_number '4'
    city 'Essen'
    plz '45139'
    phone '717465'
    trait :organization_address do
      addressable_type 'Tafel'
    end
    trait :donator_address do
      addressable_type 'Donator'
    end
    trait :transporter_address do
      addressable_type 'Transporter'
    end
  end

  factory :transporter do
    name 'Von A nach B'
    email 'transporterB@byom.de'
  end

  factory :donator do
    name 'EdlerSpender'
    email 'edlerspenderB@byom.de'
  end

  factory :donation do
    food 'Bananen'
    amount 10
    unit 'kg'
    expiry_date '2017-10-30'
    ordered false
    delivery_date '2017-10-25'
    factory :donation_with_share do
      after(:create) do |donation|
        create(:share, donation: donation)
      end
    end
  end

  factory :share do
    amount 6
    pick_up true
    pick_up_date '2017-10-28'
  end
end
