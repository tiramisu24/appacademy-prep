#iterative, with/without prc
require "byebug"
# def bubble_sort(arr)
#   prc ||= Proc.new{|x,y| x<=>y}
#   sorted = false
#   dup = arr.dup
#   until sorted
#     idx1 = 0
#     sorted = true
#     while idx1< dup.length() -1
#       idx2 = idx1 +1
#       # case dup[idx1] <=> dup[idx2]
#       case prc.call(dup[idx1],dup[idx2])
#       when 1
#         dup[idx1],dup[idx2] = dup[idx2],dup[idx1]
#         sorted = false
#       end
#       idx1 +=1
#     end
#   end
#   dup
# end
#
# def rec_bb(arr)
#   dup = arr.dup
#   dup[0...-1].each_with_index do |el,idx|
#     idx2 = idx +1
#     case dup[idx1] <=> dup[idx2]
#     when 1
#       dup[idx1],dup[idx2] = dup[idx2],dup[idx1]
#       rec_bb(dup)
#     end
#   end
#   dup
# end
#
# def quicksort(arr)
#   return arr if arr.length <= 1
#   midpoint = arr[arr.length/2]
#   left = []
#   right = []
#   arr.each do |el|
#     if el < midpoint
#       left << el
#     elsif el > midpoint
#       right << el
#     end
#   end
#   quicksort(left) + [midpoint] + quicksort(right)
# end
#with prc & monkey patching
# class Array
#   def quicksort(&prc)
#     prc ||= Proc.new{|a,b| a <=> b }
#     return self if self.length <= 1
#     midpoint = self[self.length/2]
#     left = []
#     right = []
#     self.each do |el|
#       case prc.call(el,midpoint)
#       when -1
#         left << el
#       when 1
#         right << el
#       end
#     end
#     left.quicksort(&prc) + [midpoint] + right.quicksort(&prc)
#   end
# end
#
# def merge_sort(arr)
#   return arr if arr.length <= 1
#   mdix = arr.length/2
#   # debugger
#   left = merge_sort(arr[0...mdix])
#   right = merge_sort(arr[mdix..-1])
#   merge(left, right)
# end
# class Array
#   def merge_sort(&prc)
#     prc ||= Proc.new{|a,b| a<=>b}
#     return self if self.length <= 1
#     mdix = self.length/2
#     # debugger
#     left = self[0...mdix].merge_sort(&prc)
#     right = self[mdix..-1].merge_sort(&prc)
#     merge(left, right,&prc)
#   end
#   def merge(arr1,arr2,&prc)
#     new_arr = []
#     until arr1.empty? || arr2.empty?
#       case prc.call(arr1.first,arr2.first)
#       when -1
#         new_arr << arr1.shift
#       when 1
#         new_arr << arr2.shift
#       end
#     end
#     new_arr += arr1 + arr2
#
#   end
# end

def binary_search(arr, target)
  midx = arr.length/2
  return nil if arr.empty?
  # debugger
  if (arr[midx] < target)
    result = binary_search(arr[midx + 1..-1], target)
    midx + result +1 unless result.nil? 

  elsif  (arr[midx] > target)
    binary_search(arr[0...midx], target)
  elsif (arr[midx] == target)
    return midx
  end
end


# puts("\nTests for #merge_sort")
# puts("===============================================")
#     puts "merge_sort([]) == []: "  + (merge_sort([]) == []).to_s
#     puts "merge_sort([1]) == [1]: "  + (merge_sort([1]) == [1]).to_s
#     puts "merge_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]: "  + (merge_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]).to_s
# puts("===============================================")
#
# puts("\nTests for #merge_sort")
# puts("===============================================")
#     puts "merge_sort([]) == []: "  + ([].merge_sort() == []).to_s
#     puts "merge_sort([1]) == [1]: "  + ([1].merge_sort() == [1]).to_s
#     puts "merge_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]: "  + ([5, 4, 3, 2, 1].merge_sort() == [1, 2, 3, 4, 5]).to_s
# puts("===============================================")

puts binary_search([1, 2, 3], 1) # => 0
puts binary_search([2, 3, 4, 5], 3) # => 1
puts binary_search([2, 4, 6, 8, 10], 6) # => 2
puts binary_search([1, 3, 4, 5, 9], 5) # => 3
puts binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
puts binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
puts binary_search([1, 2, 3, 4, 5, 7], 6) # => nil
