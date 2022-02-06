defmodule Elixery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Elixery.Users.Agent, as: UserAgent
  alias Elixery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when params are valid, return the user" do
      params = %{
        name: "Lukita",
        address: "Rua dos Coqueiros",
        email: "lukita@coqueiro.com",
        cpf: "12345678900",
        age: 19
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or update with sucessful"}

      assert response == expected_response
    end

    test "when there are invalid params, return an error" do
      params = %{
        name: "Lukita",
        address: "Rua dos Coqueiros",
        email: "lukita@coqueiro.com",
        cpf: "12345678900",
        age: 15
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
