local function diamond(which)
  local SPACE = "."
  local CHAR_OFFSET = string.byte("A")

  local num_spaces = string.byte(which) - CHAR_OFFSET
  local matrix = {}

  for i = 0, num_spaces do
    local row = {}

    local j = num_spaces - i
    if (j > 0) then
      while j > 0 do
        table.insert(row, SPACE)
        j = j - 1;
      end
    end

    table.insert(row, string.char(i + CHAR_OFFSET))

    j = num_spaces - i
    if (j > 0) then
      while j > 0 do
        table.insert(row, SPACE)
        j = j - 1;
      end
    end

    table.insert(matrix, table.concat(row, ""))
  end

  print(table.concat(matrix, "\n"))
end

diamond "B"
--[[ diamond "B"
diamond "C"
diamond "H" ]]

--[[ return function(which)

end ]]
