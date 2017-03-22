require './lib/node'
require 'pry'

class BinarySearchTree

    attr_accessor :node, :right, :left, :root, :node_depth, :root_depth
  
  def initialize
    @node = nil
    @right = nil
    @left = nil
    @root = nil
    @root_depth = 0
    @node_depth = 1
    
  end

  def create_root(score, title)
    @root = Node.new(score, title)
    @root_depth
  end

  def insert(score, title, node = root, node_depth = 1)
    if score < node.score && node.left == nil
      node.left = Node.new(score, title)
      node_depth
    elsif score > node.score && node.right == nil
      node.right = Node.new(score, title)
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
  

end