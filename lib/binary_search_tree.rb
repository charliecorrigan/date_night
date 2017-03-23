require './lib/node'
require 'pry'

class BinarySearchTree

    attr_accessor :node, :right, :left, :parent, :root, :node_depth, :root_depth, :sorted_list
  
  def initialize
    @node = nil
    @right = nil
    @left = nil
    @parent = nil
    @root = nil
    @root_depth = 0
    @node_depth = 1
    @sorted_list = []
    @right_side_sorted = []
  end

  def create_root(score, title)
    @root = Node.new(score, title)
    @root_depth
  end

  def insert(score, title, node = root, node_depth = 1)
    if score < node.score && node.left == nil
      node.left = Node.new(score, title, node)
      node_depth
    elsif score > node.score && node.right == nil
      node.right = Node.new(score, title, node)
      node_depth
    elsif score < node.score
      
      insert(score, title, node.left, (node_depth + 1))
    else score > node.score
      
      insert(score, title, node.right, (node_depth + 1))
    end
  end

  def include?(value, include_node = root)
    if include_node.score == value
      true
    elsif include_node.score < value && include_node.right == nil
      false
    elsif include_node.score > value && include_node.left == nil
      false
    elsif include_node.score < value
      include?(value, include_node.right)
    else include_node.score > value
      include?(value, include_node.left)
    end
  end
    
  def depth_of(value, current_node = root, current_depth_of = 0)
    if current_node.score == value
      current_depth_of
    elsif current_node.score < value && current_node.right == nil
      nil
    elsif current_node.score > value && current_node.left == nil
      nil
    elsif current_node.score < value
      depth_of(value, current_node.right, (current_depth_of + 1))
    else current_node.score > value
      depth_of(value, current_node.left, (current_depth_of + 1))
    end
  end
  
  def max(current_node = root)
    if current_node.right == nil
      max_value = {}
      max_value[current_node.title] = current_node.score
      max_value
    else
      max(current_node.right)
    end
  end

  def min(current_node = root)
    if current_node.left == nil
      min_value = {}
      min_value[current_node.title] = current_node.score
      min_value
    else
      min(current_node.left)
    end
  end


  def sort_left_side(current_node = root)
  
    return @sorted_list if current_node == root && (current_node.left == nil || @sorted_list.include?(current_node.left)) && (current_node.right == nil || @sorted_list.include?(current_node.right))
      if current_node.left != nil && @sorted_list.include?(current_node.left) == false
        sort_left_side(current_node.left)
      else
        @sorted_list << current_node
        if current_node.right != nil && @sorted_list.include?(current_node.right) == false
          sort_left_side(current_node.right)
        else
          while @sorted_list.include?(current_node.parent) == true
            current_node = current_node.parent
          end
          return @sorted_list if current_node == root && (current_node.left == nil || @sorted_list.include?(current_node.left)) && (current_node.right == nil || @sorted_list.include?(current_node.right))
          sort_left_side(current_node.parent)
        end
      end
    end

    def format_sorted_list
      new_list = []
      @sorted_list.each do |item| 
        new_list << {item.title=> item.score}
      end
      new_list
    end

    def load(text_file)
      new_file = File.open(text_file, "r")
      movies = new_file.read
      movies_array = movies.split("\n").to_a.map do |each| #"71, Hannibal Buress: Animal Furnace"
        each.split(",").to_a
      end
      
      formatted_movies = []
      movies_array.map do |value_pair| #["71", "Hannibal Buress: Animal Furnace"]
        value_pair[0] = value_pair[0].to_i
        value_pair[1] = value_pair[1].lstrip
        formatted_movies << [value_pair[0], value_pair[1]]
      end

      counter = 0
      
      formatted_movies.each do |value_pair|
        if counter < 1
          create_root(value_pair[0], value_pair[1])
        else
          insert(value_pair[0], value_pair[1])
        end
        counter += 1
      end
      counter
    end
      
    # def insert_by_array_of_arrays
    #   counter = 0
    #   test_input = [[50, "Titanic"],[20, "Grandma's Boy"],[98, "Twister"]]

    #   test_input.each do |value_pair|
        
    #     insert(value_pair[0], value_pair[1])
    #     counter += 1
    #   end
      
    # end
    
end