require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'name', email: 'email')
  end
  
  test "should be valid" do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '  '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'name should have a maximum length of 30' do
    @user.name = 'a'*31
    assert_not @user.valid?
  end

  test 'email should have a maximum length of 255' do
    @user.email = 'a'*244 + '@example.com' 
    assert_not @user.valid?
  end
end
