defmodule KitchenCalculator do
  @units %{
    milliliter: 1,
    teaspoon: 5,
    tablespoon: 15,
    fluid_ounce: 30,
    cup: 240
  }

  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, @units[unit] * volume}

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @units[unit]}

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter |> from_milliliter(unit)
end
