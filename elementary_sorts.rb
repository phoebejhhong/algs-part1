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
    while h < length/3
      # 3x+1 increment sequence (1, 4, 13, 40, 121, 364, ...)
      h = 3 * h + 1
    end

    while h > 0
      # h-sort the array (insertion sort)
      for i in (h..length-1)
        j = i
        while j >= h
          exchange(j, j-h) if self[j] < self[j-h]
          j -= h
        end
      end
      h /= 3
    end

    self
  end


  # helper function
  def exchange(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

print [4,2,6,7,1,0,3,5].selection_sort
print [4,2,6,7,1,0,3,5].insertion_sort
print [4,2,6,7,1,0,3,5].shell_sort
