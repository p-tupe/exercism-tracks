return function(str)
  local chars = {}

  for c in str:lower():gmatch('%a') do
    if (chars[c]) then return false end
    chars[c] = true
  end

  return true
end

