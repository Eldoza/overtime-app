FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'Chuck'
    last_name 'Norris'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    phone '5555555555'
    ssn 1234
    company "Cool Guy Inc."
  end
  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    phone '5555555555'
    ssn 1234
    company "Cool Guy Inc."
  end
  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    phone '5555555555'
    ssn 1234
    company "Cool Guy Inc."
  end
end
