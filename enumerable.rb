module Enumerable

  def my_each
    return self unless block_given?
    for i in self
      yield i
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in self
      yield(i, self.index(i))
    end
  end
  
  def my_select
    return self unless block_given?
    new = []
    for i in self
      new << i if yield(i)
    end
    return new
  end
  
  def my_all?
    for i in self
      if block_given?
        return false if not yield(i)
      else
        return false if not i
      end
    end
    return true
  end
  
  def my_any?
    for i in self
      if block_given?
        return true if yield(i)
      else
        return true if i
      end
    end
    return false
  end
  
  def my_none?
    for i in self
      if block_given?
        return false if yield(i)
      else
        return false if i
      end
    end
    return true
  end

  def my_count (find = "")
    result = 0
    for i in self
      if block_given?
        result += 1 if yield(i)
      elsif find != ""
        result += 1 if i == find
      else return self.length
      end
    end
    return result
  end
  
  def my_map(proc = nil)
    new = []
    if proc != nil
      for i in self
        new << proc.call(i)
      end
    else return self
    end
    return new
  end
  
  def my_map2(proc = nil)
     
    result = []
    for i in self
      if proc and block_given?
        result << yield(proc.call(i))
      elsif proc
        result << proc.call(i)
      else return self
      end
    end
    return result
  end
  
  def my_inject
    accumulator = self.first
    if self.is_a?(Array)
        for i in (1...(self.count))
          accumulator = yield(accumulator, self[i])
        end
    elsif self.is_a?(Range)
        for i in ((self.first(2).last)..(self.last))
          accumulator = yield(accumulator, i)
        end
    end
  return accumulator
  end
end

def multiply_els(array)
  array.my_inject { |i1, i2| i1 * i2 }
end