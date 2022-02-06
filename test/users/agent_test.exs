defmodule Elixery.Users.AgentTest do
  use ExUnit.Case

  import Elixery.Factory

  alias Elixery.Users.Agent, as: UserAgent

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      user = build(:user)

      response = UserAgent.save(user)

      expected_response = :ok

      assert response == expected_response
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, return the user", %{cpf: cpf} do
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      response = UserAgent.get(cpf)

      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      invalid_cpf = "banana"

      response = UserAgent.get(invalid_cpf)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
