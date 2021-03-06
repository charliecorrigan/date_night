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
    assert_nil = tree.root.parent
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

  def test_if_node_parent_is_initializing_correctly
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(72, "Ghost")
    tree.insert(8, "The Matrix")
    tree.insert(11, "Toy Story")
    assert_equal tree.root.left.parent, tree.root
    assert_equal tree.root.right.left.parent, tree.root.right
    assert_equal tree.root.left.right.parent, tree.root.left
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

  def test_if_presort_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal tree.presort, nil
  end

  def test_if_sorted_list_returns_array
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.presort.class, Array
  end

  def test_if_presort_returns_sorted_list
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_equal tree.presort, nil
  end

  def test_if_format_sorted_list_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.presort
    assert_equal tree.format_sorted_list, [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]
  end

  def test_if_sort_exists
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute_nil = tree.sort
  end

  def test_if_sort_returns_list_sorted_and_formatted_correctly
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.sort, [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]
  end
##TODO
#Get sort function running that calls presort and format sort
  def test_if_load_exists
    
    tree = BinarySearchTree.new
    x = tree.load('movies.txt')
    refute_nil = x
  end

  def test_output_of_load
    tree = BinarySearchTree.new
    x = tree.load('movies.txt')
    assert_equal 99, x
  end

  def test_node_has_children_to_left_can_access_node_info
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.node_childless_on_left?(tree.root), false
  end

  def test_node_has_children_to_left_can_return_false
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.node_childless_on_left?(tree.root.left), true
  end

  def test_node_has_children_to_right_can_access_node_info
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.node_childless_on_right?(tree.root), false
  end

  def test_node_has_children_to_right_can_return_false
    tree = BinarySearchTree.new
    tree.create_root(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.node_childless_on_right?(tree.root.right), true
  end
end

