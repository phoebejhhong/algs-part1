require_relative '../priority_queue'
require_relative 'board'

class EightPuzzleSolver
  attr_accessor :priority_queue, :number_of_moves

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
    @number_of_moves = 0
  end

  def is_solvable

  end

  def solve
    while true do
      current_node = priority_queue.delete_min

      if current_node.board.is_goal?
        puts "Minimum number of moves = #{current_node.number_of_moves}"

        current_node.to_s
        return
      else
        @number_of_moves += 1
        current_node.board.neighbors.each do |neighbor|
          previous_node = current_node.previous_node
          unless previous_node && neighbor == previous_node.board
            neighbor_node = SearchNode.new(neighbor, number_of_moves, current_node)
            priority_queue.insert(neighbor_node)
          end
        end
      end
    end
  end

  class SearchNode
    include Comparable
    attr_accessor :board, :previous_node

    def initialize(board, number_of_moves, previous_node)
      board.number_of_moves = number_of_moves
      @board = board
      @previous_node = previous_node
    end

    def <=> (another_node)
      self.board.hamming <=> another_node.board.hamming
    end

    def number_of_moves
      board.number_of_moves
    end

    def to_s
      board.to_s
      previous_node.to_s unless previous_node.nil?
    end
  end
end

if __FILE__ == $0
  EightPuzzleSolver.run(ARGF.readlines)
end
