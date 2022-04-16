defmodule FreelancerRates do
  @daily_hours 8.0
  @monthly_days 22

  def daily_rate(hourly_rate), do: @daily_hours * hourly_rate

  def apply_discount(before_discount, discount), do: before_discount * (1 - discount / 100)

  def monthly_rate(hourly_rate, discount) do
    (@monthly_days * daily_rate(hourly_rate))
    |> apply_discount(discount)
    |> Float.ceil()
    |> Kernel.round()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    price = daily_rate(hourly_rate) |> apply_discount(discount)
    (budget / price) |> Float.floor(1)
  end
end
