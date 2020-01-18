def iterative_bsearch(a, value)
  low, hi = get_limits(a)
  while low < hi
    mid = (low + hi) / 2
    if a[mid] == value
      return mid
    elsif a[mid] < value
      low = mid + 1
    else
      hi = mid
    end
  end
  false
end

def recursive_bsearch(a, value)
  low, hi = get_limits(a)
  if low >= hi
    return false
  end
  mid = (low + hi) / 2
  if a[mid] == value
    mid
  elsif a[mid] < value
    recursive_bsearch(a[(mid+1)..hi], value)
  else
    recursive_bsearch(a[low..mid], value)
  end
end

def get_limits(a)
  [0, a.length - 1]
end

array = 10000.times.map { rand(1500) }.sort
random_elements = 10000.times.map { rand(2000) }

Benchmark.bm do |x|
  x.report "iterative_bsearch".center(30) do
    random_elements.each {  |el| iterative_bsearch(array, el) }
  end
  x.report "Array#index".center(30) do
    random_elements.each {  |el| array.index(el) }
  end
  x.report "Array#bsearch".center(30) do
    random_elements.each {  |el| array.bsearch { |a| a == el } }
  end
  x.report "recursive_bsearch".center(30) do
    random_elements.each {  |el| array.index(el) }
  end
end

# =>
# user                 system      total        real
# iterative_bsearch    0.010000   0.000000   0.010000 (  0.012161)
# Array#index          0.280000   0.000000   0.280000 (  0.276750)
# Array#bsearch        0.010000   0.000000   0.010000 (  0.010482)
# recursive_bsearch    0.290000   0.010000   0.300000 (  0.293534)
