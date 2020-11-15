class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :day
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  with_options presence: true do
    validates :title
    validates :user_id
    validates :text
  end
  
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :cost_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
end
