5.times do |n|
  #女の子
  User.seed do |s|
    s.id = "#{n+1}"
    s.name = Faker::Name.female_first_name
    s.email = "test#{n+1}@gmail.com"
    s.specification = "seeddataf#{n+1}"
    s.birthday = "2000-01-01"
    s.icon  = Rails.root.join("db/fixtures/images/user_f_#{n+1}.jpg").open
    s.password  = "password"
  end
  #男の子
  User.seed do |s|
    s.id = "#{n+6}"
    s.name = Faker::Name.male_first_name
    s.email = "test#{n+6}@gmail.com"
    s.specification = "seeddatam#{n+1}"
    s.birthday  = "2000-12-31"
    s.icon  = Rails.root.join("db/fixtures/images/user_m_#{n+1}.jpg").open
    s.password  = "password"
  end
end
