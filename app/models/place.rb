class Place < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :menus
  has_many :users, through: :likes
end
