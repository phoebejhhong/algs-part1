require_relative '../union_find'

class Percolation

  attr_reader :side, :cells, :states

  def initialize(n)
    @side = n
    @cells = UnionFind.new(n*n + 2)
    @states = Array.new(n*n + 2, 0)
    states[-2..-1] = 1, 1
  end

  def open(row, col)
    check_range(row, col)
    return if is_open?(row, col)

    idx = get_index(row, col)
    states[idx] = 1

    # if not top row
    if row != 1 && is_open?(row-1, col)
      union(get_index(row-1, col), idx)
    elsif row == 1
      # connect to virtual top
      union(idx, side * side)
    end
    # if not bottom row
    if row != side && is_open?(row+1, col)
      union(get_index(row+1, col), idx)
    elsif row == side
      # connect to virtual bottom
      union(idx, side * side+1)
    end
    # if not left border
    if col != 1 && is_open?(row, col-1)
      union(get_index(row, col-1), idx)
    end
    # if not top row
    if col != side && is_open?(row, col+1)
      union(get_index(row, col+1), idx)
    end
  end

  def is_open?(row, col)
    check_range(row, col)
    idx = get_index(row, col)

    states[idx] == 1
  end

  def is_full?(row, col)
    check_range(row, col)
    cells.connected(side * side, get_index(row, col))
  end

  def percolates?
    cells.connected(side * side, side * side + 1)
  end

  def get_index(row, col)
    side * (row - 1) + col - 1;
  end

  def check_range(row, col)
    raise if row < 0 || col < 0 || row > side || col > side
  end

  def union(i, j)
    unless cells.connected(i, j)
      cells.union(i, j)
    end
  end

end
