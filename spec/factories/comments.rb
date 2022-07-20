# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    task
  end

  trait :with_file do
    file { Rack::Test::UploadedFile.new('app/spec/fixtures/default_book.png', 'default_book.png') }
  end
end
