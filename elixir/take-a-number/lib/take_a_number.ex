defmodule TakeANumber do
  def start(), do: spawn(&loop/0)

  def loop(t \\ 0) do
    receive do
      :stop -> :ok
      {:report_state, sender_pid} -> send(sender_pid, t) |> loop
      {:take_a_number, sender_pid} -> send(sender_pid, t + 1) |> loop
      _ -> loop(t)
    end
  end
end
