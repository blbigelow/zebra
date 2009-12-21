require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Reply.new.valid?
  end
end
