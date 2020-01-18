class MoveNode
  attr_accessor :position, :next_moves, :predecessor

  def initialize(position=nil)
    @position = position
    @next_moves = nil
    @predecessor = []
  end

end

class Knight
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def knight_moves(start, finish)
    if !valid_moves?(start, finish)
      return puts "Invalid board position. Please enter coordinates between 0 - 7."
    end
    node = search(start, finish)
    moves = node.predecessor.reverse << node.position
    puts "You made it in #{moves.count} moves. Here's your path:"
    moves.each { |move| p move }
    nil
  end

  private

  def possible_moves(move_node)
    knight = move_node.position.cycle
    moves = [-2, -1, -1, -2, 1, -2, 2, -1, 2, 1, 1, 2, -1, 2, -2, 1]
    move_node.next_moves = moves.each_slice(2)
                                .map { |x, y| MoveNode.new([x + knight.next, y + knight.next]) }
                                .select { |node| (0..7) === node.position[0] && (0..7) === node.position[1] }
  end

  def search(start, target)
    self.root = MoveNode.new(start)
    queue = []
    queue << root
    while !queue.empty?
      node = queue.shift
      return node if node.position == target
      node.next_moves = possible_moves(node)
      node.next_moves.each do |x|
        x.predecessor << node.position
        node.predecessor.each { |y| x.predecessor << y }
        queue << x
      end
    end
  end

  def valid_moves?(start, finish)
    (start + finish).all? { |num| (0..7) === num }
  end

end

  knight = Knight.new()
  knight.knight_moves [1,1],[2,2]
