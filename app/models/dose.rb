class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :amount, :unit, :cocktail_id, :ingredient_id, presence:true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  validates :unit, inclusion: { in: %w(oz cup tsp slice unit), message: "%(value) is not valid unit! Must be oz, cup, tsp, slice or unit" }
end
