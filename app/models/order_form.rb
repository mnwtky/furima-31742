class OrderForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  validates :postal_code, :prefecture_id, :city, :addresses, :phone_number, :token, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A^0\d{9,10}$\z/, message: "Input only number"}
  validates :prefecture_id, numericality: { other_than: 1, message: "select"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end