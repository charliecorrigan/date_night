class Node
  attr_accessor :score, :title
  def initialize(score, title, node = nil)
    @score = score
    @title = title
    @left = nil
    @node = nil
  end

  def insert(score, title, left = nil, node = nil)

    if @node == nil
      @node = Node.new(score, title, @left)
    else
      if @node.left == nil
        @node.left = Node.new(score, title)
      else
        insert(score, title, node.left)
      end
    end  
  end
end



root = Node.new(50, "Lion King")
node = root.insert(12, "Jurassic World")
# node = root.insert(2, "Dukes of Hazard")
puts root.score
puts node.score
puts node.left


#   def oldest_anscestor(anscestor)      #def insert(node)
#     if anscestor                        #if node is full
#       if anscestor.mom                    #if node.left is full
#         oldest_anscestor(anscestor.mom)     #insert(node.left)
#       else                                #else plop node here
#         anscestor
#       end
#     end
#   end


#   end
  
# end


# if @node == nil
#       @node = Node.new(score, title)
#     else
#       if score < node.score
#         if @node.left == nil
#           @node.left = Node.new(score, title)
#         else
#           #node left isn't nil. Node left contains the Matrix
#           #If it's full, we want to know the score of what's
#           #parked there.
#           #@node.left.score
#           #we're going to compare that score to the argumet
#           #just called score
#           if score < node.left.score
            
#         end
#       else
#         @node.right = Node.new(score, title)
#       end
#     end