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

  def test_root_parent_is_nil
    tree = BinarySearchTree.new
    tree.create_root(99, "Kill Bill Vol. 1")
    assert_equal nil, tree.root.parent
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

  def test_if_insert_can_insert_left_of_root_then_right_of_root
    tree = BinarySearchTree.new
    tree.create_root(50, "Kill Bill Vol. 1")
    tree.insert(40, "The Matrix")
    tree.insert(60, "Jurassic World")
    assert_equal "The Matrix", tree.root.left.title
    assert_equal "Jurassic World", tree.root.right.title
  end

  def test_if_insert_inserts_at_predictable_locations
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(72, "Ghost")
    tree.insert(8, "The Matrix")
    tree.insert(11, "Toy Story")
    assert_equal tree.root.score, 61
    assert_equal tree.root.left.score, 16
    assert_equal tree.root.right.score, 92
    assert_equal tree.root.left.right.score, 50
    assert_equal tree.root.right.left.score, 72
    assert_equal tree.root.left.left.score, 8
    assert_equal tree.root.left.left.right.score, 11
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
    e = tree.insert(72, "Ghost")
    f = tree.insert(8, "The Matrix")
    g = tree.insert(11, "Toy Story")
    assert_equal a, 0
    assert_equal b, 1
    assert_equal c, 1
    assert_equal d, 2
    assert_equal e, 2
    assert_equal f, 2
    assert_equal g, 3
  end

  def test_if_include_verifies_presence_of_score
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal true, tree.include?(16)
  end

  def test_if_include_verifies_absense_of_score
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal false, tree.include?(12)
  end

  def test_if_depth_of_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal nil, tree.depth_of(16)
  end
  
  def test_if_depth_of_returns_nil_if_value_is_absent
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_nil tree.depth_of(12)
  end

  def test_if_depth_of_returns_correct_values
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(72, "Ghost")
    tree.insert(8, "The Matrix")
    tree.insert(11, "Toy Story")
    assert_equal 3, tree.depth_of(11)
    assert_equal 2, tree.depth_of(8)
    assert_equal 2, tree.depth_of(50)
    assert_equal 2, tree.depth_of(72)
    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(92)
  end

  def test_if_max_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal nil, tree.max
  end

  def test_if_max_returns_title_with_highest_score
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal [92], tree.max.values
    assert_equal ["Sharknado 3"], tree.max.keys
  end

  def test_if_min_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal nil, tree.min
  end

  def test_if_min_returns_title_with_lowest_score
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal [16], tree.min.values
    assert_equal ["Johnny English"], tree.min.keys
  end

  def test_if_sort_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal tree.sort, nil
  end

#---------------ABORTED SORT------------------------
  # def test_if_sort_exists
  #   tree = BinarySearchTree.new
  #   tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #   refute_equal tree.sort, nil
  # end

  # def test_if_sort_returns_array
  #   tree = BinarySearchTree.new
  #   tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #   assert_equal tree.sort.class, Array
  # end

  # def test_sort_right_side
  #   skip
  #   tree = BinarySearchTree.new
  #   tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #   tree.insert(72, "Ghost")
  #   tree.insert(8, "The Matrix")
  #   tree.insert(11, "Toy Story")
  #   assert_equal sorted_list.count, 2
  # end

  # def test_find_next_biggest_value_exists
  #   tree = BinarySearchTree.new
  #   tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #   tree.insert(72, "Ghost")
  #   tree.insert(8, "The Matrix")
  #   tree.insert(11, "Toy Story")
  #   refute_equal tree.find_next_biggest_value, nil
  # end

  # def test_find_next_biggest_value_returns_array
  #   tree = BinarySearchTree.new
  #   tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #   tree.insert(72, "Ghost")
  #   tree.insert(8, "The Matrix")
  #   tree.insert(99, "Princess Bride")
  #   tree.insert(68, "Scary Movie")
  #   tree.insert(11, "Toy Story")
  #   assert_equal tree.find_next_biggest_value, ["stuff"]
  # end

  # def test_find_next_smallest_vale_exists
  #   skip
  # end
  #tree.create_root(61, "Bill & Ted's Excellent Adventure")
  #tree.insert(16, "Johnny English")
  #tree.insert(92, "Sharknado 3")
  #tree.insert(50, "Hannibal Buress: Animal Furnace")

end

