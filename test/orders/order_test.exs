defmodule Elixery.Orders.OrderTest do
  use ExUnit.Case

  import Elixery.Factory

  alias Elixery.Orders.Order

  describe "build/4" do
    test "when all params are valid, return an order" do
      user = build(:user)
      items = build_list(2, :item)

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when all params are invalid, return an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
