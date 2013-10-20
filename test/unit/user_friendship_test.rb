require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)
    
  test "that creating a friendship works without raising an exeption" do
    assert_nothing_raised do
        UserFriendship.create user: users(:jim), friend: users(:rena)
    end
  end
    
    test "that creating a friendship based on user id and friend id works" do
      UserFriendship.create user_id: users(:tim).id, friend_id: users(:rena).id
      assert users(:tim).friends.include?(users(:rena))
    end
end
