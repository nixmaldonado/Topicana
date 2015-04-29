FactoryGirl.define do
  factory :user do
    email      { FFaker::Internet.email }
    password              'asdasdasd'
    password_confirmation 'asdasdasd'
    admin true
  end

end
