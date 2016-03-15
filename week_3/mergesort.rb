# Algorithms, Part I, Week 3, Mergesort

class MergeSort

  def initialize(input)
    print sort(input)
  end

  def sort(array)
    return array if array.length == 1

    mid = array.length / 2
    left = array[0..mid - 1]
    right = array[mid..-1]

    # top-bottom recursive sort
    merge(sort(left), sort(right))
  end

  private
  def merge(left, right)
    # precondition: left and right are sorted arrays
    result = Array.new

    while left.length > 0 && right.length > 0
      if left.first > right.first
        result << right.shift
      else
        result << left.shift
      end
    end

    return result + left + right
  end

end

MergeSort.new [4,2,6,7,1,0,3,5]
MergeSort.new ["S", "O", "R", "T", "S", "A", "M", "P", "L", "E"]
