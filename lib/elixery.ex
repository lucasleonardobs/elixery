defmodule Elixery do
  alias Elixery.Orders.Agent, as: OrderAgent
  alias Elixery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Elixery.Users.Agent, as: UserAgent
  alias Elixery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    OrderAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrders, as: :call
end
