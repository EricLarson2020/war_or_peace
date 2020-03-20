#goal to figure out percents
#(a/b) * 100
arr = [1, 3, 5, 7, 9, 11]
arr_high = []
arr.each do |num|
  if num > 6
    arr_high.append(num)
  end
end
#arr_high is an array
p arr_high
#arr_high_sum needs to be a number/sum of array
arr_high_sum = 0
arr_sum = 0
#arr-high sum
arr_high.each do |num|
  arr_high_sum += num
end
p arr_high_sum

#arr sum
arr.each do |num|
  arr_sum += num
end
p arr_sum
# arr_sum += arr

#percent high
percent_high = (arr_high_sum.to_f/arr_sum.to_f) * 100
p percent_high
