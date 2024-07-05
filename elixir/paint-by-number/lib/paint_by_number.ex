defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    pow_fn(1, color_count)
  end

  defp pow_fn(size, color_count) do
    if Integer.pow(2, size) >= color_count, do: size, else: pow_fn(size + 1, color_count)
  end

  def empty_picture(), do: <<>>
  def test_picture(), do: <<27>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(nil, _), do: nil
  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    palette_size = palette_bit_size(color_count)
    <<first_pixel::size(palette_size), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(nil, _), do: nil
  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    palette_size = palette_bit_size(color_count)
    <<_::size(palette_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
