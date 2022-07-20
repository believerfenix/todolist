# frozen_string_literal: true

RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end

Dir[Rails.root.join('spec/docs/**/*.rb')].sort.each { |file| require file }

Dox.configure do |config|
  config.desc_folder_path = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = %w[Accept X-Auth-Token Authorization]
  config.title = 'API'
  config.api_version = '1.0'
end
