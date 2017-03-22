require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_create_root_creates_new_root
    tree = BinarySearchTree.new
    tree.create_root(10, "Tester Movie")
    refute_equal nil, tree.root
  end

  def test_score_is_accessible_in_root
    tree = BinarySearchTree.new
    tree.create_root(99, "Kill Bill Vol. 1")
    assert_equal 99, tree.root.score
  end

  def test_if_inserting_node_to_root_on_left
    tree = BinarySearchTree.new
    tree.create_root(99, "Kill Bill Vol. 1")
    tree.insert(80, "Fellowship of the Ring")
    assert_equal "Fellowship of the Ring", tree.root.left.title
  end

  def test_if_inserting_node_to_root_on_right
    tree = BinarySearchTree.new
    tree.create_root(99, "Kill Bill Vol. 1")
    tree.insert(100, "Fellowship of the Ring")
    assert_equal "Fellowship of the Ring", tree.root.right.title
  end

  def test_if_insert__is_recursive_to_left
    tree = BinarySearchTree.new
    tree.create_root(99, "Kill Bill Vol. 1")
    tree.insert(75, "The Matrix")
    tree.insert(2, "Jurassic World")
    assert_equal "The Matrix", tree.root.left.title
    assert_equal "Jurassic World", tree.root.left.left.title
  end

  def test_if_insert__is_recursive_to_right
    tree = BinarySearchTree.new
    tree.create_root(50, "Kill Bill Vol. 1")
    tree.insert(75, "The Matrix")
    tree.insert(90, "Jurassic World")
    assert_equal "The Matrix", tree.root.right.title
    assert_equal "Jurassic World", tree.root.right.right.title
  end

  def test_if_insert_can_go_right_then_left
    tree = BinarySearchTree.new
    tree.create_root(50, "Kill Bill Vol. 1")
    tree.insert(75, "The Matrix")
    tree.insert(66, "Jurassic World")
    assert_equal "The Matrix", tree.root.right.title
    assert_equal "Jurassic World", tree.root.right.left.title
  end

  def test_if_insert_can_go_left_then_right
    tree = BinarySearchTree.new
    tree.create_root(50, "Kill Bill Vol. 1")
    tree.insert(40, "The Matrix")
    tree.insert(45, "Jurassic World")
    assert_equal "The Matrix", tree.root.left.title
    assert_equal "Jurassic World", tree.root.left.right.title
  end

  def test_if_create_root_returns_depth_of_insertion
    tree = BinarySearchTree.new
    a = tree.create_root(50, "Kill Bill Vol. 1")
    assert_equal a, 0
  end

  def test_if_insert_returns_depth
    tree = BinarySearchTree.new
    a = tree.create_root(61, "Bill & Ted's Excellent Adventure")
    b = tree.insert(16, "Johnny English")
    c = tree.insert(92, "Sharknado 3")
    d = tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal a, 0
    assert_equal b, 1
    assert_equal c, 1
    assert_equal d, 2
  end

  #tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #tree.insert(16, "Johnny English")
  #tree.insert(92, "Sharknado 3")
  #tree.insert(50, "Hannibal Buress: Animal Furnace")

end

