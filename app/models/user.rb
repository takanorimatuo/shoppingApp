class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prefectures, dependent: destory
  has_many :addresses, dependent: destory
  has_many :banks, dependent: destory
  has_many :cards, dependent: destory
  has_many :products, dependent: destory
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :prefectures
end
