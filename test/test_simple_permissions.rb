require 'helper'

class TestSimplePermissions < Test::Unit::TestCase
  should "default values" do
    assert SimplePermissions::Config.permission_type == :role
  end
end
