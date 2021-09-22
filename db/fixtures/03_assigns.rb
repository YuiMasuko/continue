4.times do |n|
  Assign.seed do |s|
    s.id = "#{n+1}"
    s.user_id = "#{n+1}"
    s.group_id = "#{n+1}"
  end
  Assign.seed do |s|
    s.id = "#{n+5}"
    s.user_id = "#{n+6}"
    s.group_id = "#{n+1}"
  end
end
2.times do |n|
  Assign.seed do |s|
    s.id = "#{n+9}"
    s.user_id = "#{n+9}"
    s.group_id = "#{n+1}"
  end
  Assign.seed do |s|
    s.id = "#{n+11}"
    s.user_id = "#{n+1}"
    s.group_id = "5"
  end
  Assign.seed do |s|
    s.id = "#{n+13}"
    s.user_id = "5"
    s.group_id = "#{n+4}"
  end
end
