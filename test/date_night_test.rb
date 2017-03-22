require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_night.rb'

class DateNightTest < Minitest::Test

  def test_it_exists
    date = DateNight.new
    assert_instance_of DateNight, date
  end

  def test_it_creates_new_binary_tree_instance_when_instantiated
    date = DateNight.new
    refute_equal nil, date.tree
  end

end