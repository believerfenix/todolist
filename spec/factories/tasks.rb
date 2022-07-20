# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    deadline { rand(1..10).days.from_now }
    project
  end
end
