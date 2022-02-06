defmodule Elixery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Elixery.Factory

  alias Elixery.Orders.CreateOrUpdate
  alias Elixery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Elixery.start_agents()

      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      item1 = build(:item)

      item2 =
        build(:item, description: "Pizza de Camarão", unity_price: "25.00", category: :pizza)

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, return the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there are invalid items, return an error", %{
      user_cpf: cpf,
      item1: item1
    } do
      invalid_item = %{item1 | quantity: 0}
      params = %{user_cpf: cpf, items: [invalid_item]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid items"}

      assert response == expected_response
    end

    test "when there is no user with given cpf, return an error", %{
      item1: item1,
      item2: item2
    } do
      cpf = "banana"
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
