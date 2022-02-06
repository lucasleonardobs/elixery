defmodule Elixery.Factory do
  use ExMachina

  alias Elixery.Users.User
  alias Elixery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Lucas Leonardo",
      email: "lukita@coqueiro.com",
      address: "Rua dos Coqueiros",
      cpf: "12345678900",
      age: 19
    }
  end

  def item_factory do
    %Item{
      category: :prato_feito,
      description: "Bobó de Camarão",
      quantity: 2,
      unity_price: %Decimal{coef: 1800, exp: -2, sign: 1}
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua dos Coqueiros",
      items: build_list(2, :item),
      total_price: Decimal.new("72.00"),
      user_cpf: "12345678900"
    }
  end
end
