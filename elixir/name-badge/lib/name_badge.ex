defmodule NameBadge do
  def print(id, name, department) do
    id_str = if id, do: "[#{id}] - ", else: ""
    dept_str = if department, do: String.upcase(department), else: "OWNER"
    id_str <> name <> " - " <> dept_str
  end
end
