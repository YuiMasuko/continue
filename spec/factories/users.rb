FactoryBot.define do
  factory :user1, class: User do
    name { 'user1' }
    email { 'user1@gmail.com' }
    specification { 'user01' }
    birthday { '1990-01-01' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

  factory :user2, class: User do
    name { 'user2' }
    email { 'user2@gmail.com' }
    specification { 'user02' }
    birthday { '1990-01-02' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@gmail.com' }
    specification { 'user03' }
    birthday { '1990-01-03' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end
