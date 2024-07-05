defmodule HighSchoolSweetheart do
  def first_letter(name), do: String.trim(name) |> String.first()

  def initial(name), do: first_letter(name) |> String.upcase() |> Kernel.<>(".")

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    first_initial = initial(first_name)
    last_initial = initial(last_name)
    first_initial <> " " <> last_initial
  end

  def pair(full_name1, full_name2) do
    x_x = initials(full_name1)
    y_y = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{x_x}  +  #{y_y}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
