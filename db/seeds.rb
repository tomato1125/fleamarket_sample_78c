images = Image.create!([
   {item_id: 1, image:File.open('./app/assets/images/show_sample4.jpeg',)},
   {item_id: 1, image:File.open('./app/assets/images/show_sample3.png',)},
   {item_id: 1, image:File.open('./app/assets/images/show_sample2.png',)},
   {item_id: 1, image:File.open('./app/assets/images/show_sample1.png',)}
  ])

item = Item.create!(
  name: "test1",
  produce: "テスト商品です。",
  price: 8000,
  deliveryfee_id: 2,
  brand_id: 1,
  category_id: 1,
  condition_id: 1,
  prefecture_id: 1,
  deliverydate_id: 1,
  user_id: 2
)
