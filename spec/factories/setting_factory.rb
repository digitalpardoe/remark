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
  
  factory :application_name, :class => Setting do
    resource IDENTIFIER
    key 'name'
    value 'Application Name'
    hidden = false
    human_readable 'Application Name'
    required true
  end

  factory :time_zone, :class => Setting do
    resource IDENTIFIER
    key 'time_zone'
    value 'UTC'
    hidden false
    human_readable 'Time Zone'
    required true
  end
end
