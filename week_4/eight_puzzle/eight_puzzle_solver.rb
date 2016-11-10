require_relative '../priority_queue'
require_relative 'board'

class EightPuzzleSolver
  attr_accessor :priority_queue, :num_of_moves

  def self.run(lines)
    dimension = lines.shift.to_i
    blocks = []

    lines.each do |line|
      blocks << line.gsub(/\W/, '').split('').map(&:to_i)
    end

    EightPuzzleSolver.new(blocks).solve
  end

  def initialize(blocks)
    initial_board = Board.new(blocks)
    @priority_queue = BinaryHeap.new
    initial_node = SearchNode.new(initial_board, 0, nil)
    priority_queue.insert(initial_node)
    @num_of_moves = 0
  end

  def is_solvable

  end

  def solve
    while(true)
      current_node = priority_queue.delete_max
      if current_node.board.is_goal?
        current_node.board.to_s
        return
      else
        # @num_of_moves += 1
        current_node.board.neighbors.each do |neighbor|
          # neighbor.num_of_moves = num_of_moves
          neighbor_node = SearchNode.new(neighbor, num_of_moves, current_node)
          priority_queue.insert(neighbor_node)
        end
      end
    end
  end

  class SearchNode
    include Comparable
    attr_accessor :board

    def initialize(board, number_of_moves, previous_node)
      @board = board
      @number_of_moves = number_of_moves
      @previous_node = previous_node
    end

    def <=> (another_node)
      self.board.hamming <=> another_node.board.hamming
    end
  end
end

if __FILE__ == $0
  EightPuzzleSolver.run(ARGF.readlines)
end
