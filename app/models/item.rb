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

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 }
    validates :sales_status_id, numericality: { other_than: 1 }
    validates :shipping_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300 , less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end
end
