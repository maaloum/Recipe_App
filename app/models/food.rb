class Food < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :measurement_unit, presence: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipes, through: :recipe_food, dependent: :destroy
end
