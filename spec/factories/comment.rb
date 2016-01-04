FactoryGirl.define do
  factory :comment do
    sequence(:text){|i| "Problem#{i}"}
    commentable_type ""
    commentable_id 1
  end
end