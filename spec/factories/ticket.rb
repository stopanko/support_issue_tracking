FactoryGirl.define do
  problem_type = FactoryGirl.create(:problem_type)
  status = FactoryGirl.create(:status)
  factory :ticket do
    sequence(:email){|i| "Ticket#{i}"}
    user_name "Stepan"
    problem_type_id problem_type.id
    title "Title"
    text "Text"
  end
end