
def reduce(arr, initial_value = nil)
  counter = initial_value ? 0 : 1
  current_value = initial_value || arr[0]

  while counter < arr.length 
    current_value = yield(current_value, arr[counter])
    counter +=1 
  end

  current_value
end


array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
