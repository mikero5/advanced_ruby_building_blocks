module Enumerable
  ###########################
  def my_each
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end

  ###########################
  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i+=1      
    end
    self
  end

  ###########################
  def my_select
    retval = []
    self.my_each{|el|
      if yield(el) == true
        retval.push(el)
      end
    }
    retval
  end

  ###########################
  def my_all?
    retval = true
    self.my_each{|el|
      if yield(el) == false
        retval = false
      end
    }
    retval
  end

  ###########################
  def my_any?
    retval = false
    self.my_each{|el|
      if yield(el) == true
        retval = true
      end
    }
    retval
  end
  
  ###########################
  def my_none
    retval = true
    self.my_each{|el|
      if yield(el) == true
        retval = false
      end
    }
    retval
  end

  ###########################
  def my_count
    count = 0
    self.my_each {|el|
      if yield(el) == true
        count += 1
      end
    }
    count
  end
  
  ###########################
  def my_map(proc=nil)
    retval = []
    self.my_each {|el|
      if block_given?
        retval.push(yield(el))
      elsif proc
        retval.push(proc.call(el))
      end
    }
    retval
  end
  
  ###########################
  def my_inject(init_accumulate)
    accumulate = init_accumulate
    self.my_each {|el|
      accumulate = yield(accumulate, el)
    }
    accumulate
  end
  
end





###########################
[1,2,3].my_each {|el|
  puts el
}

puts "*************"
[1,2,3].my_each_with_index {|el, i|
  puts "#{i}. #{el}"
}

puts "*************"
puts [1,2,3].my_select {|el|
  el > 2
}.inspect

puts "*************"
puts [1,2,3].my_all? {|el|
  el > 0
}

puts "*************"
puts [1,2,3].my_all? {|el|
  el > 2
}

puts "*************"
puts [1,2,3].my_any? {|el|
  el > 2
}

puts "*************"
puts [1,2,3].my_any? {|el|
  el > 3
}

puts "*************"
puts [1,2,3].my_none {|el|
  el == 4
}

puts "*************"
puts [1,2,3].my_none {|el|
  el == 3
}

puts "*************"
puts [1,2,3].my_count {|el|
  el > 1
}

puts "*************"
puts [1,2,3].my_count {|el|
  el > 0
}

puts "*************"
puts [1,2,3].my_count {|el|
  el > 2
}

puts "*************"
puts [1,2,3].my_map {|el|
  el * 2
}.inspect

puts "*************"
mult_by_2 = Proc.new {|el|
  el * 2
}
puts [1,2,3].my_map(mult_by_2).inspect

puts "*************"
puts [3,4,5].my_inject(0) {|sum, el|
  sum + el
}

puts "*************"
puts [3,4,5].my_inject(1) {|prod, el|
  prod * el
}

