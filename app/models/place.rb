class Place < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :menus
end
