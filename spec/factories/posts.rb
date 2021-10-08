FactoryBot.define do
  factory :post1, class: Post do
    event_on { '2021-10-01' }
    content { 'post_test' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    group { nil }
    user { nil }
  end
end
