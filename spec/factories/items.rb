FactoryBot.define do
  factory :item do
    name             {Faker::Name.initials(number: 2)}
    description      {"商品の説明"}
    category_id      {"2"}
    condition_id     {"2"}
    postage_payer_id {"2"}
    prefecture_id    {"2"}
    handling_id      {"2"}
    price            {2000}
    association :user
  end
end
