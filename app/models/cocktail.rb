class Cocktail < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: { allow_blank: true }
  validates :category_id, presence: true

  def next
    user.cocktails.where("id > ?", id).order(id: :asc).limit(1).first
  end

  def prev
    user.cocktails.where("id < ?", id).order(id: :desc).limit(1).first
  end

end
