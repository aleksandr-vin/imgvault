require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without valid body" do
    comment = Comment.new :commenter => "John"
    assert !comment.save, "Saved the comment without body"
    comment.body = "!"
    assert !comment.save, "Saved the comment with small body"
    comment.body = "A" * 141
    assert !comment.save, "Saved the comment with big body"
    comment.body = "Valid body greater than 2 chars"
    assert comment.save, "Not saved the full crafted comment"
  end

  test "should not save comment without commenter" do
    comment = Comment.new :body => "Valid body greater than 2 chars"
    assert !comment.save, "Saved the comment without commenter"
    comment.commenter = "Jay"
    assert comment.save, "Not saved the full crafted comment"
  end
end
