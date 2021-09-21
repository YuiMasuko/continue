4.times do |n|
  Group.seed do |s|
    s.name = "#{Faker::Name.last_name}家"
    s.image  = Rails.root.join("db/fixtures/images/group_#{n+1}.jpg").open
  end
end
Group.seed do |s|
  s.name = "幼なじみ"
  s.image  = Rails.root.join("db/fixtures/images/group_5.jpg").open
end
