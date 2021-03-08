class OrderShip
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :shipping_address, :phone_number, :building_name, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :shipping_address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Ship.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, shipping_address: shipping_address, phone_number: phone_number, building_name: building_name, order_id: order.id)
  end

end