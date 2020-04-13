class Product < ApplicationRecord
  # belongs_to :user
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images
  validates :images, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_days

end
