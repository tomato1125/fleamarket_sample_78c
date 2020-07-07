FactoryBot.define do

  factory :send_information do
    family_name             {"yamada"}
    first_name              {"hanako"}
    family_name_kana        {"yamada"}
    first_name_kana         {"hanako"}
    post_code               {"000-0000"}
    prefecture_id           {"0"}
    city                    {"kanagawa-ken"}
    house_number            {"yamada-shi midori-ku"}
    apartment               {"building 501"}
    phone_number            {"00000000000"}
    user_id                 {"0"}
  end

end