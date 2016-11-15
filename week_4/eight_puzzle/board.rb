class Board
  attr_accessor :grid, :dimension, :number_of_moves

  def initialize(blocks, number_of_moves = 0)
    @dimension = blocks.size
    @grid = Marshal.load(Marshal.dump(blocks))
    @number_of_moves = number_of_moves
  end

  def self.goal(dimension)
    goal_blocks = []
    (1..dimension**2-1).to_a.each do |block|
      if block % dimension == 1
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

    num_of_wrong_position_blocks + number_of_moves
  end

  def manhattan
    sum_of_manhattan_distance = 0
    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        goal_position = goal.position(block)
        sum_of_manhattan_distance += Board.manhattan_distance([i, j], goal_position)
      end
    end

    sum_of_manhattan_distance + number_of_moves
  end

  def neighbors
    pos_of_blank = position(0)
    neighboring_positions(pos_of_blank).map do |pos_of_neighbor|
      new_board = Board.new(grid, number_of_moves + 1)
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
    puts dimension
    grid.each do |row|
      puts ' ' + row.join(' ')
    end
  end
end
