class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Prefecture
  belongs_to_active_hash :Category
  belongs_to_active_hash :Sales_status
  belongs_to_active_hash :Scheduled_delivery
  belongs_to_active_hash :Shipping_fee

  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300 , less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
end
