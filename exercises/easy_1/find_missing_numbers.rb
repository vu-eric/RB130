def missing (arr)
  index = 0 

  (arr.first..arr.last).each_with_object([]) do |num, ans|
    num == arr[index] ? index += 1 : ans << num
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []