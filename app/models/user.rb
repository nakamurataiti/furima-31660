class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
