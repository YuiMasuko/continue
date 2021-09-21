Post.seed do |s|
  s.id = 1
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_1.jpg").open
  s.content = "次女はいつも寝てばかりいます、、、！"
  s.user_id = 1
  s.group_id = 1
end

Post.seed do |s|
  s.id = 2
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_2.jpg").open
  s.content = "今年のクリスマスは猫と！涙"
  s.user_id = 10
  s.group_id = 2
end

Post.seed do |s|
  s.id = 3
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_3.jpg").open
  s.content = "家族で花火大会に行ってきました！"
  s.user_id = 8
  s.group_id = 3
end

Post.seed do |s|
  s.id = 4
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_4.jpg").open
  s.content = "最近凝った料理も作るようになりました☆"
  s.user_id = 5
  s.group_id = 4
end

Post.seed do |s|
  s.id = 5
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_5.jpg").open
  s.content = "誕生日おめでとう！コロナでなかなか会えてないけど、元気？？"
  s.user_id = 2
  s.group_id = 5
end

Post.seed do |s|
  s.id = 6
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_6.jpg").open
  s.content = "初日の出を見に遠出をしました。"
  s.user_id = 6
  s.group_id = 1
end

Post.seed do |s|
  s.id = 7
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_7.jpg").open
  s.content = "湘南からも富士山が見えました〜！！"
  s.user_id = 10
  s.group_id = 2
end

Post.seed do |s|
  s.id = 8
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_8.jpg").open
  s.content = "うちの猫の悪戯が相変わらずひどい！！！"
  s.user_id = 3
  s.group_id = 3
end

Post.seed do |s|
  s.id = 9
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_9.jpg").open
  s.content = "家の裏に野良猫集団が集結して困るけど、かわいい★"
  s.user_id = 5
  s.group_id = 4
end

Post.seed do |s|
  s.id = 10
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_10.jpg").open
  s.content = "この夏、子供達は海で丸焦げです〜！みんな元気です！"
  s.user_id = 1
  s.group_id = 1
end

Post.seed do |s|
  s.id = 11
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_11.jpg").open
  s.content = "うちの子も一年生になりました★"
  s.user_id = 2
  s.group_id = 5
end

Post.seed do |s|
  s.id = 12
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_12.jpg").open
  s.content = "おじいちゃんもワクチン２回打ちました！"
  s.user_id = 3
  s.group_id = 3
end

Post.seed do |s|
  s.id = 13
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_13.jpg").open
  s.content = "今年の夏は会えなかったけど、来年こそ一緒に海に行こうね！by子供たち"
  s.user_id = 8
  s.group_id = 3
end

Post.seed do |s|
  s.id = 14
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_14.jpg").open
  s.content = "最近仕事が大変、、、！ねこになりたい、、、！"
  s.user_id = 5
  s.group_id = 5
end

Post.seed do |s|
  s.id = 15
  s.event_on = Faker::Date.in_date_period(year: 2020, month: 8)
  s.image  = Rails.root.join("db/fixtures/images/post_15.jpg").open
  s.content = "いっぱい金魚を飼うことになりました！涙"
  s.user_id = 1
  s.group_id = 1
end
