class Node

  attr_accessor :score, :title, :left, :right, :parent

  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
    @parent = nil
  end
  

end