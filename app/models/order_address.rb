class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipality, :street_number, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_number
    validates :telephone, length: { minimum:10, maximum: 11, message: "" }
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building: building, telephone: telephone, order_id: order.id)

  end

end