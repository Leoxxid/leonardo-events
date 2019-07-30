FactoryBot.define do
  factory :event do
    action { "MyString" }
    state { "MyString" }
    locked { "MyString" }
    issue { nil }
  end
end
