require 'test_helper'

class RequestBooksControllerTest < ActionController::TestCase
  setup do
    @request_book = request_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_book" do
    assert_difference('RequestBook.count') do
      post :create, request_book: { book_id: @request_book.book_id }
    end

    assert_redirected_to request_book_path(assigns(:request_book))
  end

  test "should show request_book" do
    get :show, id: @request_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_book
    assert_response :success
  end

  test "should update request_book" do
    patch :update, id: @request_book, request_book: { book_id: @request_book.book_id }
    assert_redirected_to request_book_path(assigns(:request_book))
  end

  test "should destroy request_book" do
    assert_difference('RequestBook.count', -1) do
      delete :destroy, id: @request_book
    end

    assert_redirected_to request_books_path
  end
end
