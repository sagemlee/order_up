require 'rails_helper'

RSpec.describe "Chef Show Page" do
  it "Displays chef's name, link to their ingredients" do
    @chef1 = Chef.create(name:"Bobbly Flay")
    @cheese = Ingredient.create(name:"cheese", calories: 120)
    @sauce = Ingredient.create(name:"sauce", calories: 40)
    @dough = Ingredient.create(name:"dough", calories: 150)
    @pizza = Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: @chef1.id)
    @pasta = Dish.create(name:"pasta", description:"gooood", chef_id: @chef1.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @sauce.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @dough.id)
    DishIngredient.create(dish_id: @pasta.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @pasta.id, ingredient_id: @sauce.id)
    DishIngredient.create(dish_id: @pasta.id, ingredient_id: @dough.id)

    visit "chef/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)
    click_link "Ingredient this chef uses"

    expect(current_path).to eq("/chef/#{@chef1.id}/ingredients")

    expect(page).to have_content(@cheese.name, count: 1)
    expect(page).to have_content(@sauce.name, count: 1)
    expect(page).to have_content(@dough.name, count: 1)
  end

  xit "Display's chef's most 3 most popular ingredients" do
    @chef1 = Chef.create(name:"Bobbly Flay")

    @salad = Dish.create(name:"salad", description:"Yummy in my tummy", chef_id: @chef1.id)
    @soup = Dish.create(name:"soup", description:"Yummy in my tummy", chef_id: @chef1.id)
    @pasta = Dish.create(name:"pasta", description:"gooood", chef_id: @chef1.id)
    @pizza = Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: @chef1.id)
    @lettuce = Ingredient.create(name:"lettuce", calories: 40)
    @broth = Ingredient.create(name:"broth", calories: 40)
    @salt = Ingredient.create(name:"salt", calories: 40)
    @cheese = Ingredient.create(name:"cheese", calories: 120)
    @sauce = Ingredient.create(name:"sauce", calories: 40)
    DishIngredient.create(dish_id: @pasta.id, ingredient_id: @sauce.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @salt.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @pizza.id, ingredient_id: @sauce.id)
    DishIngredient.create(dish_id: @salad.id, ingredient_id: @lettuce.id)
    DishIngredient.create(dish_id: @salad.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @soup.id, ingredient_id: @salt.id)
    DishIngredient.create(dish_id: @soup.id, ingredient_id: @broth.id)
    visit "chef/#{@chef1.id}"

    within ".top3" do
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@salt.name)
      expect(page).to have_content(@sauce.name)
    end

  end
end
