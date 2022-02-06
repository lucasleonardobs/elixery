defmodule Elixery.Users.UserTest do
  use ExUnit.Case

  alias Elixery.Users.User

  describe "build/5" do
    test "when all params are, returns the user" do
      name = "Lucas Leonardo"
      email = "lukita@coqueiro.com"
      address = "Rua dos Coqueiros"
      cpf = "12345678900"
      age = 19

      response = User.build(name, email, address, cpf, age)

      expected_response =
        {:ok,
         %User{
           address: "Rua dos Coqueiros",
           age: 19,
           cpf: "12345678900",
           email: "lukita@coqueiro.com",
           name: "Lucas Leonardo"
         }}

      assert expected_response == response
    end

    test "when there are invalid param, return error reason 'Invalid parameters'" do
      name = "Lucas Leonardo"
      email = "lukita@coqueiro.com"
      address = "Rua dos Coqueiros"
      cpf = "12345678900"
      age = 15

      response = User.build(name, email, address, cpf, age)

      expected_response = {:error, "Invalid parameters"}

      assert expected_response == response
    end
  end
end
