class Like < ApplicationRecord
  validates :user_id, {presence: true}
  # validates :item_id, {presence: true}
  validates :place_id, {presence: true}
  # validates :post_id, {presence: true}

  belongs_to :place
end
