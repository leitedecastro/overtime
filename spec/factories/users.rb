FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "John"
    last_name "Doe"
    phone "555555555"
  end

  factory :admin_user, class: "AdminUser" do
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Paulo"
    last_name "Castro"
    phone "555555555"
  end

  factory :non_authorized_user, class: "User" do
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Unauthorized"
    last_name "User"
    phone "555555555"
  end
end
