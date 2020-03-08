class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prefectures
  has_many :addresses
  has_many :banks
  has_many :cards
  has_many :products
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :prefectures
end
