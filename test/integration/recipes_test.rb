require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create!(first_name: 'John', last_name: 'Doe',username: 'johndoe', email: 'johndoe@example.com')
    @recipe = Recipe.create!(name: 'Veggie Dumpling',
                            description: 'Asian cabbage and cilantro dumplings', user:@user)
    @recipe2 = @user.recipes.build(name: 'MyString', description: 'Slow cooked beans')
  end

  test 'should get recipe index' do
    get recipes_url
    assert_response :success
  end

  test 'should get recipes listing' do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
