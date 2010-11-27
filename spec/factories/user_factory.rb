require 'support/constants'

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
    after_create do |admin|
      admin.role = Role.retrieve(:admin)
      admin.save!
    end
    after_build do |admin|
      admin.role = Factory.create(:admin_role)
    end
  end
end
