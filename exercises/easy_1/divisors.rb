def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

def divisors(num)
  small = []
  large = []
  last = Math.sqrt(num)

  (1..last).each do |divisor|
    if num % divisor == 0 
      small << divisor
      large << num / divisor unless divisor == last
    end
  end

  small + large.reverse
end

time_it { p divisors(999962000357) == [1, 999979, 999983, 999962000357] }

# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute