FactoryBot.define do
  factory :address_order do
    postal_code     {'000-0000'} 
    phone_number    {'00000000000'} 
    prefecture_id   {1} 
    city            {'福岡'} 
    building_number {'1-2-2'} 
    building_name   {'ハイツ'} 
    token           {'tok_abcdefghijk00000000000000000'}
  end
 

end