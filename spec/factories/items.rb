FactoryBot.define do
  factory :item do
    title         {'タイトル'}
    text          {'新品です。'}
    price         {'12345'}
    days_id       {3}
    cost_id       {3}
    status_id     {3}
    prefecture_id {3}
    category_id   {3}
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/image.png')) }
  end
end



