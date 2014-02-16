# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    full_name "MyString"
    email "MyString"
    price 1.5
    location "MyString"
    rooms "MyString"
    furnished false
    through_agents false
    extra "MyText"
  end
end
