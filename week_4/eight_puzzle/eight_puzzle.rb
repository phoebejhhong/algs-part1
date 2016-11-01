require_relative '../priority_queue'

class EightPuzzleSolver
  def initialize(blocks)
    @board = Board.new(blocks)
    @priority_queue = BinaryHeap.new
  end
end


class Board
  attr_accessor :grid, :dimension

  def initialize(blocks)
    @dimension = blocks.size
    @grid = blocks
  end

  def self.goal(dimension)
    goal_blocks = []
    (1..dimension**2-1).to_a.each do |block|
      if block % 3 == 1
        goal_blocks << [block]
      else
        goal_blocks.last << block
      end
    end
    goal_blocks.last << nil

    Board.new(goal_blocks)
  end

  def is_goal?
    self == Board.goal(dimension)
  end

  def hamming

  end

  def manhattan

  end

  def twin

  end

  def ==(another_board)
    grid == another_board.grid
  end

  def neighbors

  end

  def to_s

  end
end
