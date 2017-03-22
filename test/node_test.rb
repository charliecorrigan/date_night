require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  
  def test_it_exists
    node = Node.new(99, "Kill Bill Vol. 2")
    refute_equal nil, node
  end

  def test_score_initializes_as_argument
    node = Node.new(99, "Kill Bill Vol. 2")
    assert_equal 99, node.score
  end

  def test_title_initializes_as_argument
    node = Node.new(99, "Kill Bill Vol. 2")
    assert_equal 99, node.score
  end

  def test_left_pointer_initializes_as_nil
    node = Node.new(99, "Kill Bill Vol. 2")
    assert_equal nil, node.left
  end

  def test_right_pointer_initializes_as_nil
    node = Node.new(99, "Kill Bill Vol. 2")
    assert_equal nil, node.right
  end
end