def partition arr, lo, hi, pivot_idx=nil
  if pivot_idx
    arr[hi], arr[pivot_idx] = arr[pivot_idx], arr[hi]
  end
  pivot = arr[hi]
  i = lo - 1
  (lo..hi-1).to_a.each do |j|
    if arr[j] < pivot
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  if arr[hi] < arr[i+1]
    arr[hi], arr[i+1] = arr[i+1], arr[hi]
  end
  i+1
end

def qsort_2 a_arr, a_start, a_end, b_arr, b_start, b_end
  if a_start < a_end
    a_pivot = partition a_arr, a_start, a_end
    b_pivot = partition b_arr, b_start, b_end, b_arr.find_index(a_arr[a_pivot])
    qsort_2 a_arr, a_start, a_pivot-1, b_arr, b_start, b_pivot-1
    qsort_2 a_arr, a_pivot+1, a_end, b_arr, b_pivot+1, b_end
  end
end

if __FILE__ == $0
  bolts = [5, 1, 2, 4, 3, 7, 9, 3, 2]
  nuts = [1, 4, 7, 3, 2, 5, 3, 2, 9]

  qsort_2 bolts, 0, bolts.length-1,
          nuts, 0, nuts.length-1
  print bolts
  print nuts
end
