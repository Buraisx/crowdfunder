FactoryBot.define do
  factory :comment do
    user
    project
    text "hi"
  end
end
