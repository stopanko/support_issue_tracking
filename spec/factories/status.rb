FactoryGirl.define do
  factory :status do
    sequence(:name){|i| "Status#{i}"}
  end
end