5.times do |n|
  #女の子
  User.seed(:specification) do |s|
    s.name = Faker::Name.female_first_name
    s.email = Faker::Internet.email
    s.specification = "seeddataf#{n+1}"
    s.birthday  = Faker::Date.birthday(min_age: 20, max_age: 35)
    s.icon  = Rails.root.join("db/fixtures/images/user_f_#{n+1}.jpg").open
    s.password  = Faker::Internet.password(min_length:6, max_length:20)
  end
  #男の子
  User.seed(:specification) do |s|
    s.name = Faker::Name.male_first_name
    s.email = Faker::Internet.email
    s.specification = "seeddatam#{n+1}"
    s.birthday  = Faker::Date.birthday(min_age: 20, max_age: 40)
    s.icon  = Rails.root.join("db/fixtures/images/user_m_#{n+1}.jpg").open
    s.password  = Faker::Internet.password(min_length:6, max_length:20)
  end
end
