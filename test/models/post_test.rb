require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "the presence of title" do
    post = Post.new
    assert_not post.save, "Saved the post without a title"
  end
end
