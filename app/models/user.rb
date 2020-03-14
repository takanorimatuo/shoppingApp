class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prefectures, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :banks, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :prefectures
end
