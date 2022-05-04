defmodule Username do
  def sanitize([]), do: ''

  def sanitize([h | t]), do: replace(h) ++ sanitize(t)

  defp replace(h) do
    case h do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      c when c >= ?a and c <= ?z -> [c]
      _ -> ''
    end
  end
end
