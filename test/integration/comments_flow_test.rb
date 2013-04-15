require 'test_helper'

class CommentsFlowTest < ActionDispatch::IntegrationTest
  fixtures :all

  setup do
    @image = images(:one)
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post image_path(@image) + "/comments",
           comment: { commenter: @comment.commenter, body: @comment.body }
    end

    assert_redirected_to image_path(@image)
  end
end
