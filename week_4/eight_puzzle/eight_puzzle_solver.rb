require_relative '../priority_queue'
require_relative 'board'

class EightPuzzleSolver
  attr_accessor :priority_queue, :moves

  def self.run(lines)
    dimension = lines.shift.to_i
    blocks = []

    lines.each do |line|
      blocks << line.gsub(/\W/, '').split('')
    end

    EightPuzzleSolver.new(blocks).solve
  end

  def initialize(blocks)
    initial_board = Board.new(blocks)
    @priority_queue = BinaryHeap.new
    initial_node = SearchNode.new(initial_board, 0, nil)
    priority_queue.insert(initial_node)
  end

  def is_solvable

  end

  def solve
    node = priority_queue.delete_max
    node.board.to_s
  end

  class SearchNode
    attr_accessor :board
    def initialize(board, number_of_moves, previous_node)
      @board = board
      @number_of_moves = number_of_moves
      @previous_node = previous_node
    end

    def <=> (another_node)
      if self.hemming < another_node.hemming
        -1
      elsif self.size > another_node.hemming
        1
      else
        0
      end
    end
  end
end

if __FILE__ == $0
  EightPuzzleSolver.run(ARGF.readlines)
end
