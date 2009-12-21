require 'test_helper'

class DiscussionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Discussion.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Discussion.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Discussion.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to discussion_url(assigns(:discussion))
  end
  
  def test_edit
    get :edit, :id => Discussion.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Discussion.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Discussion.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Discussion.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Discussion.first
    assert_redirected_to discussion_url(assigns(:discussion))
  end
  
  def test_destroy
    discussion = Discussion.first
    delete :destroy, :id => discussion
    assert_redirected_to discussions_url
    assert !Discussion.exists?(discussion.id)
  end
end
