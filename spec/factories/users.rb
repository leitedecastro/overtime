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
  end

  factory :admin_user, class: "AdminUser" do
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Paulo"
    last_name "Castro"
  end
end