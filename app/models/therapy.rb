class Therapy < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments

  validates :title, :text, presence: true
  validates :text, :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
end
