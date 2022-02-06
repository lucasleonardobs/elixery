defmodule Elixery.Orders.AgentTest do
  use ExUnit.Case

  alias Elixery.Orders.Agent, as: OrderAgent

  import Elixery.Factory

  describe "save/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "saves the order" do
      order = build(:order)

      response = OrderAgent.save(order)

      assert {:ok, _uuid} = response
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, return the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)
      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      invalid_uuid = "banana"

      response = OrderAgent.get(invalid_uuid)

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
