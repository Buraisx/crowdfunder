require_relative '../test_helper'

class CommentTest < ActiveSupport::TestCase
  test "text is required" do
  	comment = build(:comment, text: nil)
    assert comment.invalid?
  end
end
