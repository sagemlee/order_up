class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    dishes.map do |dish|
      dish.ingredients
    end.flatten.uniq
  end

end
