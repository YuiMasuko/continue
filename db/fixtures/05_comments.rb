9.times do |n|
  Comment.seed do |s|
    s.id = "#{n+1}"
    s.user_id = "#{n+1}"
    s.post_id = "#{n+1}"
    s.content = Faker::JapaneseMedia::StudioGhibli.quote
  end
end
4.times do |n|
  Comment.seed do |s|
    s.id = "#{n+10}"
    s.user_id = "#{n+1}"
    s.post_id = "#{n+6}"
    s.content = Faker::JapaneseMedia::StudioGhibli.quote
  end
end
