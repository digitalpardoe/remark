FactoryGirl.define do
  factory :page do
    title 'Title'
    body "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis convallis augue, a fringilla risus faucibus nec. Maecenas at nunc augue. Duis blandit posuere nisl a feugiat. Mauris porttitor justo consectetur tellus sodales eu aliquet enim lobortis. Curabitur urna augue, cursus ac posuere quis, pretium vel lectus. Etiam sit amet tortor vitae magna pellentesque eleifend ut non risus. Sed quis magna neque, sit amet interdum leo. In eleifend justo sagittis libero molestie et scelerisque ipsum tristique. Donec scelerisque venenatis mi, vitae egestas nisl luctus eget. Aliquam erat volutpat. Suspendisse potenti. Fusce at leo feugiat massa elementum ornare. Aenean aliquet leo vel lacus auctor ac fermentum nisi suscipit. Morbi mollis orci tortor. Morbi id viverra magna. Aenean volutpat tristique lorem. Ut scelerisque placerat libero rutrum molestie. Quisque scelerisque imperdiet nisl sit amet blandit. Proin lorem purus, sollicitudin non rutrum eget, varius at justo. Etiam ac velit vitae nisl tincidunt consequat eget vel libero.\n\nSed pulvinar, felis eget lobortis facilisis, nisl sapien congue lacus, sed viverra elit est non nibh. Cras rutrum eros et leo fringilla egestas. Etiam congue mollis lacinia. Fusce purus nisl, auctor non placerat pulvinar, auctor et purus. Curabitur ornare porttitor nibh, vel interdum ante convallis vel. Praesent in ante turpis. Nullam viverra enim a tellus auctor imperdiet. Nam pharetra dignissim metus eu facilisis. Nunc id elementum erat. Nulla varius, est id fringilla commodo, dolor metus consequat eros, vel tincidunt ante enim sed mauris. Pellentesque vel velit sed tortor vulputate auctor. Fusce at arcu turpis."
    text_filter 'markdown'
    published_at Time.now
    association :user, :factory => :admin
  end
end