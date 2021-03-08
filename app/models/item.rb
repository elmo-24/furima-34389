class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee

  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { greater_than_or_equal_to: 300 , less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
    
  end
end
