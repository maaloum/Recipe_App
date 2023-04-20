class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preperation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end
