require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  test "get config" do
    assert_equal 'TestName', Configuration.get(:name)
    assert_equal 'TestPassword', Configuration.get(:password)
  end

  test "set single config" do
    Configuration.set({:password => 'NewPassword'})
    assert_equal 'NewPassword', Configuration.get(:password)
  end

  test "set multible config" do
    Configuration.set({:password => 'NewPassword', :name => 'NewName'})
    assert_equal 'NewPassword', Configuration.get(:password)
    assert_equal 'NewName', Configuration.get(:name)
  end
end
