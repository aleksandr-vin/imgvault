require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test "should get new" do
    get :new
    assert_response 401, "Lacks for auth"

    fake_auth("jay", "123")

    get :new
    assert_response :success
  end

  test "should create image" do
    assert_no_difference('Image.count') do
      post :create, image: { author: @image.author, title: @image.title }
    end

    assert_response 401, "Lacks for auth"

    fake_auth("jay", "123")

    assert_difference('Image.count') do
      post :create, image: { author: @image.author, title: @image.title }
    end

    assert_redirected_to image_path(assigns(:image))
  end

  test "should show image" do
    get :show, id: @image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image
    assert_response 401, "Lacks for auth"

    fake_auth("jay", "123")

    get :edit, id: @image
    assert_response :success
  end

  test "should update image" do
    put :update, id: @image, image: { author: @image.author, title: @image.title }
    assert_response 401, "Lacks for auth"

    fake_auth("jay", "123")

    put :update, id: @image, image: { author: @image.author, title: @image.title }
    assert_redirected_to image_path(assigns(:image))
  end

  test "should destroy image" do
    assert_no_difference('Image.count') do
      delete :destroy, id: @image
    end

    assert_response 401, "Lacks for auth"
    
    fake_auth("jay", "123")
    
    assert_difference('Image.count', -1) do
      delete :destroy, id: @image
    end

    assert_redirected_to images_path
  end
end
