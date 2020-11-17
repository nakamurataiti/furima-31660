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
    validates :text
    validates :image
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' }

  validates_inclusion_of :price, in: 300..999_999_999, message: 'は範囲以内の価格で記述してください'
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :days_id
    validates :prefecture_id
    validates :status_id
  end
end
