require 'rails_helper'

RSpec.describe "Dish Show Page" do
  it "Displays list of ingredients for that dish" do
     chef1 = Chef.create(name:"Bobbly Flay")
     Dish.create(name:"pizza", description:"Yummy in my tummy", chef_id: chef1.id)

     visit
  end
end




# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
