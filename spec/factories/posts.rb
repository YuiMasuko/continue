FactoryBot.define do
  factory :post1, class: Post do
    event_on { '2021-10-01' }
    text { 'post_test' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "/spec/fixtures/test.jpg"), 'image/jpg') }
    group { nil }
    user { nil }
  end
end
