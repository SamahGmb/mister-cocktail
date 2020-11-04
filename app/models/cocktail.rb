class Cocktail < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: { allow_blank: true }
  validates :category_id, presence: true
end
