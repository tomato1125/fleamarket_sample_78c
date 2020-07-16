FactoryBot.define do
  factory :profile do
    family_name       {"山田"}
    first_name        {"太郎"}
    family_name_kana  {"ヤマダ"}
    first_name_kana   {"タロウ"}
    birth_date        {"1989-01-01"}
  end
end