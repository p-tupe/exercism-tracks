defmodule Username do
  def sanitize(username) do
    Enum.map(username, fn char ->
      case char do
        ?ä -> [?a, ?e]
        ?ö -> [?o, ?e]
        ?ü -> [?u, ?e]
        ?ß -> [?s, ?s]
        c when c in ?a..?z or c == ?_ -> c
        _ -> []
      end
    end)
    |> List.flatten()
  end
end
