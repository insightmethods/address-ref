require File.dirname(__FILE__) + '/../test_helper'
require 'invoices_controller'

# Re-raise errors caught by the controller.
class InvoicesController; def rescue_action(e) raise e end; end

class InvoicesControllerTest < Test::Unit::TestCase
  def setup
    @controller = InvoicesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invoice
    assert_difference('Invoice.count') do
      post :create, :invoice => { }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  def test_should_show_invoice
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_invoice
    put :update, :id => 1, :invoice => { }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  def test_should_destroy_invoice
    assert_difference('Invoice.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to invoices_path
  end
end
