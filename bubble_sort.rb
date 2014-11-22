def bubble_sort(list)
  must_loop = true
    while must_loop
       must_loop = false
       list.each_with_index do |element, index|
         unless index == list.length() - 1
           if list[index + 1] < list[index]
             must_loop = true
             temp = list[index + 1]
             list[index + 1] = list[index]
             list[index] = temp
           end
         end
       end
    end
  return list
end

def bubble_sort_by(list)
  must_loop = true
    while must_loop
       must_loop = false
       list.each_with_index do |element, index|
         unless index == list.length() - 1
           if yield(list[index], list[index + 1]) < 0
             must_loop = 1
             temp = list[index + 1]
             list[index + 1] = list[index]
             list[index] = temp
           end
         end
       end
    end
  return list
end