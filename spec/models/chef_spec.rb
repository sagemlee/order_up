require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    it "unique_ingredients" do
    @chef1 = Chef.create(name:"Bobbly Flay")
    @cheese = Ingredient.create(name:"cheese", calories: 120)
    @sauce = Ingredient.create(name:"sauce", calories: 40)
    @dough = Ingredient.create(name:"dough", calories: 150)
    @pizza = Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: @chef1.id)
    @pasta = Dish.create(name:"pasta", description:"gooood", chef_id: @chef1.id)
    @ingredient1 = DishIngredient.create(dish_id: @pizza.id, ingredient_id: @cheese.id)
    @ingredient2 = DishIngredient.create(dish_id: @pizza.id, ingredient_id: @sauce.id)
    @ingredient3 = DishIngredient.create(dish_id: @pizza.id, ingredient_id: @dough.id)
    @ingredient1 = DishIngredient.create(dish_id: @pasta.id, ingredient_id: @cheese.id)
    @ingredient2 = DishIngredient.create(dish_id: @pasta.id, ingredient_id: @sauce.id)
    @ingredient3 = DishIngredient.create(dish_id: @pasta.id, ingredient_id: @dough.id)

    expect(@chef1.unique_ingredients).to eq([@cheese, @sauce, @dough])
  end
  end
end
