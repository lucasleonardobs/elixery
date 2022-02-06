defmodule Elixery.Orders.ReportTest do
  use ExUnit.Case

  import Elixery.Factory

  alias Elixery.Orders.Agent, as: OrderAgent
  alias Elixery.Orders.Report

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      :ok
    end

    test "creates the report" do
      Report.create("report_test.csv")
      response = File.read!("report_test.csv")

      expected_response =
        "12345678900,prato_feito,2,18.00prato_feito,2,18.00,72.00\n12345678900,prato_feito,2,18.00prato_feito,2,18.00,72.00\n"

      assert response == expected_response
    end
  end
end
