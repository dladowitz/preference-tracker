# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showing_tracking do
    association :user
    name "855 Front St"
    bathrooms 1.5
    price 899000
    design_personality 14
    exterior 4
    city "San Francisco"
    bedrooms 3
    street_address "855 Front St"
    general_condition 5
    kitchen 4
    neighborhood 3
    landscaping 4
    square_footage 4
    master_bedroom 5
    commute 5
    home_layout 3
    local_schools 2
    notes "This place is radical!"
  end
end
