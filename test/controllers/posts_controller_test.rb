require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)

    assert assigns(:posts).size == 2, "There were not 2 posts! #{assigns(:posts).inspect}"
  end

end
