# Algorithms, Part I, Week 3, Quicksort

class QuickSort

  def initialize(input)
    print sort(input.shuffle)
  end

  # use extra arrays instead of inplace partitioning
  def sort(array)
    return array if array.length <= 1
    less, more = [], []
    # first element as pivot value
    pivot = array.delete_at(0)

    array.each { |el| el < pivot ? less << el : more << el}

    sort(less) + [pivot] + sort(more)
  end

end

QuickSort.new([4,2,6,7,1,0,3,5])
QuickSort.new ["S", "O", "R", "T", "S", "A", "M", "P", "L", "E"]
