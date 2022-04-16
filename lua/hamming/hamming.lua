local Hamming = {}

function Hamming.compute(a,b)
  if (#a ~= #b) then return -1 end

  local distance = 0

  for i = 1, #a do
    local dnaA = a:sub(i, i)
    local dnaB = b:sub(i, i)
    if (dnaA ~= dnaB) then distance = distance + 1 end
  end

  return distance;
end

return Hamming
