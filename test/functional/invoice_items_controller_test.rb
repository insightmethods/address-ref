require File.dirname(__FILE__) + '/../test_helper'
require 'invoice_items_controller'

# Re-raise errors caught by the controller.
class InvoiceItemsController; def rescue_action(e) raise e end; end

class InvoiceItemsControllerTest < Test::Unit::TestCase
  def setup
    @controller = InvoiceItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invoice_item
    assert_difference('InvoiceItem.count') do
      post :create, :invoice_item => { }
    end

    assert_redirected_to invoice_item_path(assigns(:invoice_item))
  end

  def test_should_show_invoice_item
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_invoice_item
    put :update, :id => 1, :invoice_item => { }
    assert_redirected_to invoice_item_path(assigns(:invoice_item))
  end

  def test_should_destroy_invoice_item
    assert_difference('InvoiceItem.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to invoice_items_path
  end
end
