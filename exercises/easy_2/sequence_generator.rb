def step(start_val, end_val, step_val)
  curr_val = start_val
  while curr_val <= end_val
    yield(curr_val)
    curr_val += step_val 
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }