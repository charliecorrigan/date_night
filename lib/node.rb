class Node

  attr_accessor :score, :title, :left, :right

  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
  end
  

end