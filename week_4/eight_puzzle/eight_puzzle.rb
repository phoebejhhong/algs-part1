require_relative '../priority_queue'

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


class Board
  attr_accessor :grid, :dimension, :num_of_moves

  def initialize(blocks)
    @dimension = blocks.size
    @grid = Marshal.load(Marshal.dump(blocks))
    @num_of_moves = 0
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
    # blank cell is represented with 0
    goal_blocks.last << 0

    Board.new(goal_blocks)
  end

  def self.manhattan_distance(first_position, second_position)
    (first_position.reduce(:+) - second_position.reduce(:+)).abs
  end

  def goal
    Board.goal(dimension)
  end

  def is_goal?
    self == goal
  end

  def position(target_block)
    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        return [i,j] if block == target_block
      end
    end
  end

  def hamming
    num_of_wrong_position_blocks = 0

    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        goal_block = goal[i][j]
        # ignore if goal_block is 0 (blank cell)
        if goal_block != 0 && block != goal_block
          num_of_wrong_position_blocks += 1
        end
      end
    end

    num_of_wrong_position_blocks + num_of_moves
  end

  def manhattan
    sum_of_manhattan_distance = 0
    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        goal_position = goal.position(block)
        sum_of_manhattan_distance += Board.manhattan_distance([i, j], goal_position)
      end
    end

    sum_of_manhattan_distance + num_of_moves
  end

  def neighbors
    pos_of_blank = position(0)
    neighboring_positions(pos_of_blank).map do |pos_of_neighbor|
      new_board = Board.new(grid)
      new_board.switch(pos_of_blank, pos_of_neighbor)
    end
  end

  def switch(pos_one, pos_two)
    grid[pos_one[0]][pos_one[1]], grid[pos_two[0]][pos_two[1]] = grid[pos_two[0]][pos_two[1]], grid[pos_one[0]][pos_one[1]]

    self
  end

  def neighboring_positions(target_position)
    i, j = target_position

    [[i+1, j], [i, j+1], [i-1, j], [i, j-1]].select { |pos| in_range?(pos) }
  end

  def in_range?(position)
    position.all? { |n| n >= 0 && n < dimension }
  end

  def ==(another_board)
    grid == another_board.grid
  end

  def [](i)
    grid[i]
  end

  def to_s
    grid.each do |row|
      puts row.join(' ')
    end
  end
end

if __FILE__ == $0
  EightPuzzleSolver.run(ARGF.readlines)
end
