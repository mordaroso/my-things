require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  test "get config" do
    assert_equal 'TestName', Configuration.get(:name)
    assert_equal 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', Configuration.get(:password)
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
