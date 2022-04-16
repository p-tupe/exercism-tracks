defmodule GuessingGame do
  def compare(_, guess \\ nil)
  def compare(_, guess) when not is_integer(guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number === guess, do: "Correct"
  def compare(secret_number, guess) when abs(secret_number - guess) === 1, do: "So close"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
end
