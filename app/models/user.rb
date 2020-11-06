class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' } do
  validates :first_name_kana
  validates :last_name_kana
  end
  validates :birthday, presence: true
end
