class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}
  validates :name, :description, :image, presence: true
  with_options numericality: { other_than: 1, message: "select"} do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_id
  end
end