FactoryBot.define do

  factory :send_information do
    id                      {1}
    family_name             {"yamada"}
    first_name              {"hanako"}
    family_name_kana        {"yamada"}
    first_name_kana         {"hanako"}
    post_code               {"000-0000"}
    prefecture_id           {"1"}
    city                    {"kanagawa-ken"}
    house_number            {"yamada-shi midori-ku"}
    apartment               {"building 501"}
    phone_number            {"00000000000"}
    user_id                 {"1"}

    created_at              {"2020-07-07"}
    updated_at              {"2020-07-07"}
  end

end