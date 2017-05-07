require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @recipe = Recipe.new(name:'Chicken',description:'Chicken masala curry')
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name should be present' do
    @recipe.name = ''
    assert_not @recipe.valid?
  end

  test 'description should be present' do
    @recipe.description = ''
    assert_not @recipe.valid?
  end

  test 'description should be more than 5 characters' do
    @recipe.description = 'a'*3
    assert_not @recipe.valid?
  end

  test 'description should be less than 500 characters' do
    @recipe.description = 'a'*501
    assert_not @recipe.valid?
  end

  # has a chef_id

  # max length for name
end
