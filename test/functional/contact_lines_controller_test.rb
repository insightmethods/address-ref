require File.dirname(__FILE__) + '/../test_helper'
require 'contact_lines_controller'

# Re-raise errors caught by the controller.
class ContactLinesController; def rescue_action(e) raise e end; end

class ContactLinesControllerTest < Test::Unit::TestCase
  def setup
    @controller = ContactLinesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_lines)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_contact_line
    assert_difference('ContactLine.count') do
      post :create, :contact_line => { }
    end

    assert_redirected_to contact_line_path(assigns(:contact_line))
  end

  def test_should_show_contact_line
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_contact_line
    put :update, :id => 1, :contact_line => { }
    assert_redirected_to contact_line_path(assigns(:contact_line))
  end

  def test_should_destroy_contact_line
    assert_difference('ContactLine.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to contact_lines_path
  end
end
