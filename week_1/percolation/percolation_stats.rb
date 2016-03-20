require_relative './percolation'
require 'descriptive_statistics'

class PercolationStats

  attr_reader :attempts

  # perform t independent experiments on an n-by-n grid
  def initialize (n, t)
    raise unless n > 0 && t > 0
    @attempts = []

    t.times do
      perc = Percolation.new(n)
      steps = 0
      until perc.percolates?
        row, col = rand(n) + 1, rand(n) + 1
        unless perc.is_open?(row, col)
          perc.open(row, col)
          steps += 1
        end
      end
      attempts << steps * 1.0 /(n*n)
    end
  end

  def mean
    attempts.mean
  end

  def stddev
    attempts.standard_deviation
  end
end

ps = PercolationStats.new(300,1000);
puts "mean = #{ps.mean}"
puts "std dev = #{ps.stddev}"
