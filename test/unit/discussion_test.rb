require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Discussion.new.valid?
  end
end
