defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(checkout_datetime, 28)
    else
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    cond do
      (difference = Date.diff(actual_return_datetime, planned_return_date)) > 0 -> difference
      true -> 0
    end
  end

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)
    number_of_days_late = days_late(return_date(checkout_datetime), actual_return_datetime)

    rate = if monday?(actual_return_datetime), do: rate * 0.5, else: rate

    trunc(number_of_days_late * rate)
  end
end
