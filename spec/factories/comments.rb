FactoryBot.define do
  factory :comment do
    user { nil }
    post { nil }
    content {'test'}
  end
end
