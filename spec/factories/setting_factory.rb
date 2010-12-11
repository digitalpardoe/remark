FactoryGirl.define do
  factory :setting do
    resource IDENTIFIER
    key 'key'
    value 'value'
    hidden false
    human_readable 'Test Key'
    required true
  end
end
