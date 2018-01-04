require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "test_name", email: "test@gmail.com")
    @recipe = Recipe.create(name: "vegetables2", description: "add vegetables and oil", chef: @chef)
    
  end
  
  
  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body 
  end
end
