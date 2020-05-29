require 'rails_helper'

RSpec.describe "Chef Show Page" do
  it "Displays chef's name, link to their ingredients" do
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

    visit "chef/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)
    click_link "Ingredient this chef uses"

    expect(current_path).to eq("chef/#{chef1.id}/ingredients")

    expect(page).to have_content(@ingredient1.name, count: 1)
    expect(page).to have_content(@ingredient2.name, count: 1)
    expect(page).to have_content(@ingredient3.name, count: 1)
  end
end
