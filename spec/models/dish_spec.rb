require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "method" do

    it ".total_calories" do
      chef1 = Chef.create(name:"Bobbly Flay")
      cheese = Ingredient.create(name:"cheese", calories: 120)
      sauce = Ingredient.create(name:"sauce", calories: 40)
      dough = Ingredient.create(name:"dough", calories: 150)
      pizza = Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: chef1.id)
      DishIngredient.create(dish_id: pizza.id, ingredient_id: cheese.id)
      DishIngredient.create(dish_id: pizza.id, ingredient_id: sauce.id)
      DishIngredient.create(dish_id: pizza.id, ingredient_id: dough.id)
      expect(pizza.total_calories).to eq(310)
    end

  end
end
