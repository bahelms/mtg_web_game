FactoryGirl.define do
  factory :user do
    username "Bob"
    email "bob@foobar.com"
    password "@123abc!"
    password_confirmation "@123abc!"
  end
end
