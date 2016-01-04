FactoryGirl.define do
  factory :problem_type do
    sequence(:name){|i| "Problem#{i}"}
  end
end