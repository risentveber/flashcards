FactoryGirl.define do

  factory :user do
    email 'boris@gmail.com'
    password 'secret'
    password_confirmation 'secret'
  end

end
