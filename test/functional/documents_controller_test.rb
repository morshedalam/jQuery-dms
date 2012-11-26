require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document" do
    document = {
        :name => 'Ruby on Rails',
        :path => fixture_file_upload('files/ruby_on_rails_book.xml', 'text/xml')
    }

    assert_difference('Document.count') do
      post :create, :document => document
    end

    assert_redirected_to documents_path()
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document
    end

    assert_redirected_to documents_path
  end
end
