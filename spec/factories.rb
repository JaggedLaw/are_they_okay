require 'faker'

FactoryGirl.define do

  factory :question do
    question Faker::Lorem.sentence
  end

  factory :user do
    name Faker::Name.name
  end

  factory :answer do
    answer "Yes"
  end

end
