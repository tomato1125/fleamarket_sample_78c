FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/images/pict-reason-01.jpg")}
  end
end