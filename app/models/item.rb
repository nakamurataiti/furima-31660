class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
end
