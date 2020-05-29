class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    dishes.map do |dish|
      dish.ingredients
    end.flatten.uniq
  end

  # def top_ingredients
  #   Chef.joins(:dishes, :dish_ingredients, :ingredients)
  #       .select('dish_ingredient.ingredient_id, ingredient.name')
  #       .group('dish_ingredient.ingredient_id')
  #       .order('sum(dish_ingredient.ingredient_id)')
  #       .limit (3)
  # end
end
