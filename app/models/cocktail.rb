class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  validates :description, presence: { allow_blank: true }
end
