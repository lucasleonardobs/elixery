defmodule Elixery.Orders.ItemTest do
  use ExUnit.Case

  import Elixery.Factory

  alias Elixery.Orders.Item

  describe "build/4" do
    test "when all params are valid, return an item" do
      description = "Bobó de Camarão"
      category = :prato_feito
      unity_price = "18.00"
      quantity = 2

      response = Item.build(description, category, unity_price, quantity)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, return an error" do
      description = "Bobó de Camarão"
      category = :invalid_category
      unity_price = "18.00"
      quantity = 2

      response = Item.build(description, category, unity_price, quantity)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, return an error" do
      description = "Bobó de Camarão"
      category = :prato_feito
      unity_price = "invalid_price"
      quantity = 2

      response = Item.build(description, category, unity_price, quantity)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, return an error" do
      description = "Bobó de Camarão"
      category = :prato_feito
      unity_price = "18.00"
      quantity = 0

      response = Item.build(description, category, unity_price, quantity)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
