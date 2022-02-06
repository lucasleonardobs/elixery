defmodule Elixery.Factory do
  use ExMachina

  alias Elixery.Users.User

  def user_factory do
    %User{
      name: "Lucas Leonardo",
      email: "lukita@coqueiro.com",
      address: "Rua dos Coqueiros",
      cpf: "12345678900",
      age: 19
    }
  end
end
