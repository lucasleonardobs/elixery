defmodule Elixery do
  alias Elixery.Users.Agent, as: UserAgent
  alias Elixery.Users.CreateOrUpdate

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
end
