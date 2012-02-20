require 'test_helper'

class JoinershipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Joinership.new.valid?
  end
end
