def parent_idx i
  (i-1) / 2
end

def left_child_idx i
  2*i + 1
end

def right_child_idx i
  2*i + 2
end

def heapify arr
  start_idx = parent_idx (arr.length - 1)
  while start_idx >= 0
    shiftdown arr, start_idx, arr.length - 1
    start_idx = start_idx - 1
  end
end

def shiftdown arr, start_idx, end_idx
  root_idx = start_idx

  while (left_child_idx root_idx) <= end_idx
    child_idx = left_child_idx root_idx
    swap_idx = root_idx
    swap_idx = child_idx if arr[swap_idx] < arr[child_idx]

    if child_idx + 1 <= end_idx && arr[swap_idx] < arr[child_idx + 1]
      swap_idx = child_idx + 1
    end
    if swap_idx == root_idx
      return
    else
      arr[root_idx], arr[swap_idx] = arr[swap_idx], arr[root_idx]
      root_idx = swap_idx
    end
  end
end

def heapsort arr
  heapify arr
  end_idx = arr.length - 1
  while end_idx > 0
    arr[0], arr[end_idx] = arr[end_idx], arr[0]
    end_idx -= 1
    shiftdown arr, 0, end_idx
  end
  arr
end

if __FILE__ == $0
  print (heapsort [6, 5, 3, 1, 8, 7, 2, 4])
end
