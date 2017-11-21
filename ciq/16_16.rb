
def countsort arr
  k = arr.max + 1
  count = Array.new k, 0
  arr.each {|elem| count[elem] += 1}

  total = 0
  (0..k-1).to_a.each do |i|
    old_count = count[i]
    count[i] = total
    total += old_count
  end

  output = Array.new arr.size, 0
  arr.each do |elem|
    output[count[elem]] = elem
    count[elem] += 1
  end
  output
end

if __FILE__ == $0
  print (countsort [0, 1, 0, 2, 3, 2, 1, 3])
end
