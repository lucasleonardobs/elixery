defmodule Elixery.Users.User do
  @keys [:name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys
end
