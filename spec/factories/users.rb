FactoryBot.define do 
  factory :user do 
      username {"kazu"}
      sequence(:email) { |n| "kazu#{n}@example.com"}
      password {"password"}
  end 
end 