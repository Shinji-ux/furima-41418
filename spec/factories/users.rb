FactoryBot.define do
  factory :user do
    nickname {'yamada'}
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kanji {'山田'}
    first_name_kanji {'太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birth_day {Faker::Date.between(from: Date.new(1980, 1, 1), to: Date.new(2019, 12, 31))}
  end
end
