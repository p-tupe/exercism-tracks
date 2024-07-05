defmodule NameBadge do
  defp get_id(id), do: if(id, do: "[#{id}] - ", else: "")
  defp get_dept(dept), do: if(dept, do: String.upcase(dept), else: "OWNER")
  def print(id, name, department), do: get_id(id) <> "#{name} - " <> get_dept(department)
end
