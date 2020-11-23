class AddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :prefecture_id, :city, :building_number, :building_name, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :city
    validates :building_number
    validates :token
    validates :user_id
    validates :item_id

  end

  def save

    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_number: building_number, building_name: building_name,order_id: order.id)
    
  end
end