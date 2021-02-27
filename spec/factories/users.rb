FactoryBot.define do
  factory :user do
    nickname              {"テストちゃん"}
    email                 {Faker::Internet.free_email}
    password              {"123test"}
    password_confirmation {password}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_date{"1995-10-29"}
  end
end