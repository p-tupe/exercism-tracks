defmodule TakeANumber do
  def start() do
    spawn(&run/0)
  end

  defp run(number \\ 0) do
    receive do
      {:take_a_number, sender_pid} ->
        send(sender_pid, number + 1)
        run(number + 1)

      {:report_state, sender_pid} ->
        send(sender_pid, number)
        run(number)

      :stop ->
        exit(0)

      _ ->
        run(number)
    end
  end
end
