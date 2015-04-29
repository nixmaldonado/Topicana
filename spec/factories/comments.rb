FactoryGirl.define do
  factory :comment do
    user
    topic
    body     { FFaker::Lorem.paragraph }
  end

end
