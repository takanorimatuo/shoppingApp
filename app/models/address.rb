class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  belongs_to :user
  validates :address_number, :address, :prefecture_id, :city, :building, :tel,  presence: true
end
