defmodule Elixery.Users.CreateOrUpdate do
  alias Elixery.Users.Agent, as: UserAgent
  alias Elixery.Users.User

  def call(%{
        name: name,
        address: address,
        email: email,
        cpf: cpf,
        age: age
      }) do
    address
    |> User.build(name, email, cpf, age)
    |> save_user()
  end

  def save_user({:ok, %User{} = user}), do: UserAgent.save(user)
  def save_user({:error, _reason} = error), do: error
end
