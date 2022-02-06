defmodule Elixery.Orders.Report do
  alias Elixery.Orders.Agent, as: OrderAgent
  alias Elixery.Orders.Item
  alias Elixery.Orders.Order

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list() do
    OrderAgent.index()
    |> Map.values()
    |> Enum.map(&order_string(&1))
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string = Enum.map(items, &item_string(&1))

    "#{cpf},#{items_string},#{total_price}\n"
  end

  defp item_string(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price}"
  end
end
