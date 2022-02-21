class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipality, :street_number, :building, :telephone
end