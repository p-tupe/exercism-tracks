defmodule GuessingGame do
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when (guess - secret_number) in [1, -1], do: "So close"
  def compare(secret_number, guess) when guess - secret_number > 0, do: "Too high"
  def compare(secret_number, guess) when guess - secret_number < 0, do: "Too low"
  def compare(_, _ \\ :no_guess), do: "Make a guess"
end
