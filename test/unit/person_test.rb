require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "sandras loans" do
    assert_equal 1, people(:sandra).loans.count

    assert_equal 1, people(:sandra).things.count
    assert_equal [things(:movie)], people(:sandra).things

    assert_equal 0, people(:sandra).borrowed_things.count
  end

  test "pascals loans" do
    assert_equal 1, people(:pascal).loans.count

    assert_equal 1, people(:pascal).things.count
    assert_equal [things(:book)], people(:pascal).things

    assert_equal 1, people(:pascal).borrowed_things.count
    assert_equal [things(:book)], people(:pascal).borrowed_things
  end
end
