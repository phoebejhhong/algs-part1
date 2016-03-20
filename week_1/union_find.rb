# Algorithms, Part I, Week 1, Union-Find

class QuickFind
  attr_accessor :id

  def initialize(n)
    self.id = (0..n-1).to_a
  end

  def connected(p, q)
    id[p] == id[q]
  end

  def union(p,q)
    # quadratic array access
    pid = id[p]
    id.map! { |i| (i == pid) ? id[q] : i }
  end
end

class QuickUnion
  attr_accessor :id

  def initialize(n)
    self.id = (0..n-1).to_a
  end

  def root(i)
    while id[i] != i
      i = id[i]
    end

    i
  end

  def connected(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    # trees can be too tall
    id[p] = root(q)
  end
end

class UnionFind
  # weighted quick union with path compression
  attr_accessor :id, :sz

  def initialize(n)
    self.id = (0..n-1).to_a
    self.sz = Array.new(n) {1}
  end

  def root(i)
    while id[i] != i
      # make every other node in path point to its grandparent
      # id[i] = id[id[i]]
      i = id[i]
    end

    i
  end

  def connected(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    # weighted union
    i = root(p)
    j = root(q)

    return if i == j

    if sz[i] < sz[j]
      id[i] = j
      sz[j] += sz[i]
    else
      id[j] = i
      sz[i] += sz[j]
    end
  end

end
