require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ProductGroupsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_product_groups)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_product_groups
    assert_difference('Admin::ProductGroups.count') do
      post :create, :product_groups => { }
    end

    assert_redirected_to product_groups_path(assigns(:product_groups))
  end

  def test_should_show_product_groups
    get :show, :id => admin_product_groups(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => admin_product_groups(:one).id
    assert_response :success
  end

  def test_should_update_product_groups
    put :update, :id => admin_product_groups(:one).id, :product_groups => { }
    assert_redirected_to product_groups_path(assigns(:product_groups))
  end

  def test_should_destroy_product_groups
    assert_difference('Admin::ProductGroups.count', -1) do
      delete :destroy, :id => admin_product_groups(:one).id
    end

    assert_redirected_to admin_product_groups_path
  end
end
