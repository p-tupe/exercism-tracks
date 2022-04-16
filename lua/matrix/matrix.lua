return function(string)
  local _rows, _columns = {}, {}

  for line in (string .. "\n"):gmatch(".-\n") do
    local row, c = {}, 1

    for digit in line:gmatch("%d+") do
      table.insert(row, tonumber(digit))

      if (_columns[c] == nil) then _columns[c] = {} end
      table.insert(_columns[c], tonumber(digit))
      c = c + 1
    end
    table.insert(_rows, row)
  end

  return {
    row = function(i) return _rows[i] end,
    column = function(i) return _columns[i] end
  }

end
