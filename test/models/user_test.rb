require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(first_name: 'sankalp',
                     last_name: 'sharma',
                     username: 'sankalp404',
                     email: 'sankalp404@gmail.com')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'first name should be present' do
    @user.first_name = ''
    assert_not @user.valid?
  end

  test 'last name should be present' do
    @user.last_name = ''
    assert_not @user.valid?
  end

  test 'username should be present' do
    @user.username = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'first name should be less than 30 characters' do
    @user.first_name = 'a' * 31
    assert_not @user.valid?
  end

  test 'last name should be less than 30 characters' do
    @user.last_name = 'a' * 31
    assert_not @user.valid?
  end

  test 'username should be less than 30 characters' do
    @user.username = 'a' * 31
    assert_not @user.valid?
  end

  # The format of email addresses is local-part@domain
  # where the local part may be up to 64 characters long
  # and the domain may have a maximum of 255 characters

  test 'email should be less than 64 characters' do
    @user.username = 'a' * 65 + '@example.com'
    assert_not @user.valid?
  end

  test 'email reject incorrect format' do
    @user.email = "sa'nka@@@45com"
    assert_not @user.valid?
  end

  test 'email should be unique and case insensitive' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should be lower case before saving in db' do
    mixed_email = 'SANKALP404@gmail.com'
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.reload.email
  end

end
