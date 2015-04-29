FactoryGirl.define do
  factory :topic do
    user
    body      { FFaker::Lorem.paragraph }
    title     { FFaker::Lorem.words }
  end

end
