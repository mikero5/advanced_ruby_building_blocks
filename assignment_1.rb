#
#
#
#

#############################
def swap(array, idx1, idx2)
  temp = array[idx1]
  array[idx1] = array[idx2]
  array[idx2] = temp
end

#############################
def bubble_sort(array)
  end_val = 1;

  while end_val < array.length
    for idx in (0..array.length-end_val) 
      if idx == array.length-1
        break;
      end
      swap(array, idx, idx+1) if array[idx] > array[idx+1];
    end
    end_val += 1;
  end
  
  array
end

#############################
def bubble_sort_by(array)
  end_val = 1;

  while end_val < array.length
    for idx in (0..array.length-end_val)
      if idx == array.length-1
        break;
      end
      first = array[idx]
      second = array[idx+1]
      diff = yield(first, second)
      swap(array, idx, idx+1) if diff > 0;
    end
    end_val += 1;
  end
  
  array
end

#############################
puts bubble_sort([5,3,4,1]).inspect

puts bubble_sort_by([3,2,1]) {|left, right|
  left - right
}.inspect


puts bubble_sort_by(["hi","hello","hey"]) { |left,right|
  left.length - right.length
}.inspect
