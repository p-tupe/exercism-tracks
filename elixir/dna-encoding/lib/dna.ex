defmodule DNA do
  @acid_to_code %{
    ?\s => 0,
    ?A => 1,
    ?C => 2,
    ?G => 4,
    ?T => 8
  }

  @code_to_acid %{
    0 => ?\s,
    1 => ?A,
    2 => ?C,
    4 => ?G,
    8 => ?T
  }

  def encode_nucleotide(code_point), do: @acid_to_code[code_point]

  def decode_nucleotide(encoded_code), do: @code_to_acid[encoded_code]

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc),
    do: do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::size(4)>>)

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, acc), do: acc

  defp do_decode(<<head::size(4), tail::bitstring>>, acc),
    do: do_decode(tail, acc ++ [decode_nucleotide(head)])
end
