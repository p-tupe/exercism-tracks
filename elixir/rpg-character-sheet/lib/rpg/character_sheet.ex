defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def prompt(prop), do: IO.gets("What is your character's #{prop}?\n") |> String.trim()
  def ask_name(), do: prompt("name")
  def ask_class(), do: prompt("class")
  def ask_level(), do: prompt("level") |> String.to_integer()

  def run() do
    welcome()

    %{name: ask_name(), class: ask_class(), level: ask_level()}
    |> IO.inspect(label: "Your character")
  end
end
