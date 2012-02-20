require 'test_helper'

class JoinershipsControllerTest < ActionController::TestCase
  def test_create_invalid
    Joinership.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Joinership.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    joinership = Joinership.first
    delete :destroy, :id => joinership
    assert_redirected_to root_url
    assert !Joinership.exists?(joinership.id)
  end
end
