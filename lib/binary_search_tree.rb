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

  def insert(score, title, node = root)
    if score < node.score && node.left == nil
      node.left = Node.new(score, title)
      @node_depth
    elsif score > node.score && node.right == nil
      node.right = Node.new(score, title)
      @node_depth
    elsif score < node.score
      @node_depth +=1
      insert(score, title, node.left)
    else score > node.score
      @node_depth +=1
      insert(score, title, node.right)
    end

  end
    
    
    
  

end