require File.expand_path("../../support/constants", __FILE__)

FactoryGirl.define do
  factory :password, :class => User do
    password PASSWORD
    password_confirmation PASSWORD
  end
  
  factory :user, :parent => :password do
    username 'user'
    email { "#{username}@example.com" }
    association :role, :factory => :user_role
  end
  
  factory :admin, :parent => :password do
    username 'admin'
    email { "#{username}@example.com" }
    association :role, :factory => :user_role
    after(:create) do |admin|
      admin.role = Role.retrieve(:admin)
      admin.save!
    end
    after(:build) do |admin|
      admin.role = FactoryGirl.create(:admin_role)
    end
  end
end
