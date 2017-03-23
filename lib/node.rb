class Node

  attr_accessor :score, :title, :left, :right, :parent

  def initialize(score, title, parent = nil)
    @score = score
    @title = title
    @left = nil
    @right = nil
    @parent = parent
  end
  

end