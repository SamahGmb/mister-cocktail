class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :amount, :unit, :cocktail_id, :ingredient_id, presence:true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  validates :unit, inclusion: { in: %w(ml slice unit), message: "%(value) is not valid unit! Must be ml, slice or unit" }
end
