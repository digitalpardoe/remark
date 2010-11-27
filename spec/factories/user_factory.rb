FactoryGirl.define do
  factory :password, :class => User do
    password 'testing'
    password_confirmation 'testing'
  end
  
  factory :user, :parent => :password do
    username 'user'
    email { "#{username}@example.com" }
  end
end