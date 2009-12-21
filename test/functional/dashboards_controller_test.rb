require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  def test_show
    get :show, :id => Dashboard.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Dashboard.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Dashboard.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dashboard_url(assigns(:dashboard))
  end
  
  def test_edit
    get :edit, :id => Dashboard.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Dashboard.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Dashboard.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Dashboard.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Dashboard.first
    assert_redirected_to dashboard_url(assigns(:dashboard))
  end
  
  def test_destroy
    dashboard = Dashboard.first
    delete :destroy, :id => dashboard
    assert_redirected_to dashboards_url
    assert !Dashboard.exists?(dashboard.id)
  end
end
