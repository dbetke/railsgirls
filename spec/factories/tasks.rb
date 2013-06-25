# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    team_members "MyText"
    notes "MyText"
    idea_id 1
    completed false
  end
end
