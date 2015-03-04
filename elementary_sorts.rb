# Algorithms, Part I, Week2, Elementary Sorts

class Array

  def selection_sort
    length = self.length
    for i in (0..length-1)
      min_idx = i
      for j in (i+1..length-1)
        min_idx = j if self[min_idx] > self[j]
      end
      exchange(i, min_idx)
    end

    self
  end

  def insertion_sort
    length = self.length
    for i in (0..length-1)
      for j in (i).downto(1)
        exchange(j, j-1) if self[j] < self[j-1]
      end
    end

    self
  end

  def shell_sort
    length = self.length
    h = 1
    while 
  end

  # helper
  def exchange(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

print [4,2,6,0,3].selection_sort
print [4,2,6,0,3].insertion_sort
