local TracedArray = require('TracedArray')
function bin(first, last, array, target)
  if (first > last) then return -1 end

  local mid = math.floor((first + last)/ 2)

  local value = array[mid]

  if (value == target) then return mid end

  if (value < target) then return bin(mid + 1, last, array, target) end

  if (value > target) then return bin(first, mid - 1, array, target) end

  return -1
end
function find(array, target)
  print(#array)
  if (#array < 1) then return -1 end
  return bin(1, #array, array, target)
end
    local array = TracedArray{ 6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322 }

    print(find(array, 54322))
    print(array.access_count)

return function(array, target)
  if (#array < 1) then return -1 end
  return bin(1, #array, array, target)
end


