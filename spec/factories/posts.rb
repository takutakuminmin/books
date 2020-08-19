FactoryBot.define do

  factory :post do
    image {"安宅和人"}
    title {"シン・ニホン"}
    page {"156"}
    line {"14"}
    content {"学びが多かった！"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end