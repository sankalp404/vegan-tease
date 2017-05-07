require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(first_name: 'sankalp',
                     last_name: 'sharma',
                     username: 'sankalp404',
                     email: 'sankalp404@gmail.com')
    @recipe = @user.recipes.build(name: 'Chicken', description: 'Chicken masala curry' )
  end

  test 'recipe without a user should be invalid' do
    @recipe.user_id = nil
    assert_not @recipe.valid?
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name should be present' do
    @recipe.name = ''
    assert_not @recipe.valid?
  end

  test 'name should be less than 100 characters' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end

  test 'description should be present' do
    @recipe.description = ''
    assert_not @recipe.valid?
  end

  test 'description should be more than 5 characters' do
    @recipe.description = 'a' * 3
    assert_not @recipe.valid?
  end

  test 'description should be less than 500 characters' do
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end

end
