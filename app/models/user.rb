class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true,
  format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }

  validates :nickname,  presence: true
  validates :birth_day, presence: true

with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください'} do
  validates :first_name, presence: true
  validates :last_name, presence: true
end  

with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください'} do
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
end  

end
