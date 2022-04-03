FactoryBot.define do
  factory :distribution do
    title { "MyString" }
    body { "MyText" }
    email {"test_mail"}
    time { 10 }
    randomizer { false }
  end
end
