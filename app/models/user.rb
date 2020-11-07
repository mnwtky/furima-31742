class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,               presence: true
  validates :nickname,               presence: true
end