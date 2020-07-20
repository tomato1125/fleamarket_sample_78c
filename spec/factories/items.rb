FactoryBot.define do
  factory :item do


    name {"editテスト"}
    produce {"食べ物の紹介"}
    # itemcategory_id {"1"}
    condition_id {"88888888"}
    deliveryfee_id {"3"}
    prefecture_id {"34"}
    deliverydate_id {"2"}
    price {"23456"}
    # seller_id {"1"}
    seller
    itemcategory
    images {[build(:image)]}
  end
end