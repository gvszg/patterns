require "test_helper"
require "active_record"
require "user"

class UserTest < ActiveSupport::TestCase
  def test_inialize_with_attributes
    user = User.new(id: 1, name: "James")
    assert_equal 1, user.id
    assert_equal "James", user.name
  end

  def test_find
    user = User.find(1)
    assert_kind_of User, user
    assert_equal 1, user.id
  end
end