FactoryBot.define do
  factory :department do
    name { 'English' }
  end

  factory :teacher do
    first_name { 'Test' }
    last_name { 'Teacher' }
    email { '1@example.com' }
    association :department
  end

  factory :block do
    sequence(:name) { |n| "#{n}" }
  end

  factory :classroom do
    name { 'Malone' }
  end

  factory :meeting do
    association :teacher
    association :block
    association :classroom
    course_title { 'Science!' }
  end
end
