class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :necessary_time

  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :necessary_time_id, presence: true
  validates :price, presence: true


end
