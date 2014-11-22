def bubble_sort(array)
  must_loop = true
    while must_loop
       must_loop = false
       array.each_with_index do |element, index|
         unless index == array.length() - 1
           if array[index + 1] < array[index]
             must_loop = true
             temp = array[index + 1]
             array[index + 1] = array[index]
             array[index] = temp
           end
         end
       end
    end
  return array
end

def bubble_sort_by(array)
  must_loop = true
    while must_loop
       must_loop = false
       array.each_with_index do |element, index|
         unless index == array.length() - 1
           if yield(array[index], array[index + 1]) < 0
             must_loop = 1
             temp = array[index + 1]
             array[index + 1] = array[index]
             array[index] = temp
           end
         end
       end
    end
  return array
end