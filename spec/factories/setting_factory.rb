FactoryGirl.define do
  factory :setting do
    resource IDENTIFIER
    key 'key'
    value 'value'
    hidden false
    human_readable 'Test Key'
    required true
  end
  
  factory :tracking, :class => Setting do
    resource IDENTIFIER
    key 'tracking'
    value 'some_tracking_code'
    hidden = false
    human_readable 'Tracking Code'
    required false
  end
end
