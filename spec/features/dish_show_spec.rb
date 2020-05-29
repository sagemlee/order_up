require 'rails_helper'

RSpec.describe "Dish Show Page" do
  it "Displays list of ingredients for that dish" do
     chef1 = Chef.create(name:"Bobbly Flay")
     cheese = Ingredient.create(name:"cheese", calories: 120)
     sauce = Ingredient.create(name:"sauce", calories: 40)
     dough = Ingredient.create(name:"dough", calories: 150)
     pizza = Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: chef1.id)
     DishIngredient.create(dish_id: pizza.id, ingredient_id: cheese.id)
     DishIngredient.create(dish_id: pizza.id, ingredient_id: sauce.id)
     DishIngredient.create(dish_id: pizza.id, ingredient_id: dough.id)

     visit "/dish/#{pizza.id}"

     expect(page).to have_content(cheese.name)
     expect(page).to have_content(sauce.name)
     expect(page).to have_content(dough.name)
  end
end
