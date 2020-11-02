class AddCategoryToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_reference :cocktails, :category, foreign_key: true
  end
end
