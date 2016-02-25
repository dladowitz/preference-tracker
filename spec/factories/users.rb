# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
