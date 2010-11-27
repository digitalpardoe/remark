FactoryGirl.define do
  factory :user_role, :class => Role do
    name 'user'
    human_readable 'Website User'
  end
  
  factory :admin_role, :class => Role do
    name 'admin'
    human_readable 'Administrator'
  end
end
