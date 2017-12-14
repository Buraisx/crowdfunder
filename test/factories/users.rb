FactoryBot.define do
  factory :user do
    first_name              "Johndo"
    last_name               "Roxzin"
    sequence(:email)         {|num| "JohndoRoxzin#{num}@wallawalla.co"}
    password                "12345678"
    password_confirmation   "12345678"
  end
end
