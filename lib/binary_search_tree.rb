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
  end

  def create_root(score, title)
    @root = Node.new(score, title)
    @root_depth
  end

  def insert(score, title, node = root, node_depth = 1)
    if score < node.score && node_childless_on_left?(node)
      node.left = Node.new(score, title, node)
      node_depth
    elsif score > node.score && node_childless_on_right?(node)
      node.right = Node.new(score, title, node)
      node_depth
    elsif score < node.score
      insert(score, title, node.left, (node_depth + 1))
    else score > node.score
      insert(score, title, node.right, (node_depth + 1))
    end
  end

  def node_childless_on_left?(node)
    if node.left == nil
      true
    else
      false
    end
  end

  def node_childless_on_right?(node)
    if node.right == nil
      true
    else
      false
    end
  end

  def include?(value, node = root)
    if node.score == value
      true
    elsif node.score < value && node_childless_on_right?(node)
      false
    elsif node.score > value && node_childless_on_left?(node)
      false
    elsif node.score < value
      include?(value, node.right)
    else node.score > value
      include?(value, node.left)
    end
  end
    
  def depth_of(value, node = root, current_depth_of = 0)
    if node.score == value
      current_depth_of
    elsif node.score < value && node_childless_on_right?(node)
      nil
    elsif node.score > value && node_childless_on_left?(node)
      nil
    elsif node.score < value
      depth_of(value, node.right, (current_depth_of + 1))
    else node.score > value
      depth_of(value, node.left, (current_depth_of + 1))
    end
  end
  
  def max(node = root)
    if node.right == nil
      max_value = {}
      max_value[node.title] = node.score
      max_value
    else
      max(node.right)
    end
  end

  def min(node = root)
    if node.left == nil
      min_value = {}
      min_value[node.title] = node.score
      min_value
    else
      min(node.left)
    end
  end

  def sort
    presort
    format_sorted_list
  end

  def presort(node = root)
    return @sorted_list if node == root && (node_childless_on_left?(node) || @sorted_list.include?(node.left)) && (node_childless_on_right?(node) || @sorted_list.include?(node.right))
      if !node_childless_on_left?(node) && @sorted_list.include?(node.left) == false
        presort(node.left)
      else
        @sorted_list << node
        if !node_childless_on_right?(node) && @sorted_list.include?(node.right) == false
          presort(node.right)
        else
          while @sorted_list.include?(node.parent) == true
            node = node.parent
          end
          return @sorted_list if node == root && (node_childless_on_left?(node) || @sorted_list.include?(node.left)) && (node_childless_on_right?(node) || @sorted_list.include?(node.right))
          presort(node.parent)
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

    # def load(text_file)
    #   new_file = File.open(text_file, "r")
    #   movies = new_file.read
    #   movies_array = movies.split("\n").to_a.map do |each| #"71, Hannibal Buress: Animal Furnace"
    #     each.split(",").to_a
    #   end
    #   formatted_movies = []
    #   movies_array.map do |value_pair| #["71", "Hannibal Buress: Animal Furnace"]
    #     value_pair[0] = value_pair[0].to_i
    #     value_pair[1] = value_pair[1].lstrip
    #     formatted_movies << [value_pair[0], value_pair[1]]
    #   end
    #   counter = 0
    #   formatted_movies.each do |value_pair|
    #     if counter < 1
    #       create_root(value_pair[0], value_pair[1])
    #     else
    #       insert(value_pair[0], value_pair[1])
    #     end
    #     counter += 1
    #   end
    #   counter
    # end
      
    def load(text_file)
      load_file_to_variable(text_file)
      split_text_into_arrays
      format_arrays_for_input
      input_arrays_into_tree
    end

    def load_file_to_variable(text_file)
      new_file = File.open(text_file, "r")
      @movies = new_file.read
    end

    def split_text_into_arrays
      @movies_array = @movies.split("\n").to_a.map do |each| #"71, Hannibal Buress: Animal Furnace"
        each.split(",").to_a
      end
    end

    def format_arrays_for_input
      @formatted_movies = []
      @movies_array.map do |value_pair| #["71", "Hannibal Buress: Animal Furnace"]
        value_pair[0] = value_pair[0].to_i
        value_pair[1] = value_pair[1].lstrip
        @formatted_movies << [value_pair[0], value_pair[1]]
      end
    end

    def input_arrays_into_tree
      counter = 0
      @formatted_movies.each do |value_pair|
        if counter < 1
          create_root(value_pair[0], value_pair[1])
        else
          insert(value_pair[0], value_pair[1])
        end
        counter += 1
      end
      counter
    end 
    
end