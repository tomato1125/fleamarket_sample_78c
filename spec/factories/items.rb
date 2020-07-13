FactoryBot.define do
  factory :item do
    name {"食べ物！"}
    produce {"食べ物の紹介"}
    category_id {"9999999"}
    condition_id {"88888888"}
    deliveryfee_id {"3"}
    prefecture_id {"34"}
    deliverydate_id {"2"}
    price {"23456"}
    seller_id {"1"}
    buyer_id {"2"}
    auction_id {"2"}
  end
end