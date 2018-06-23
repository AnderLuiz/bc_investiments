defmodule BcInvestiments.RatesTest do
  use ExUnit.Case

  import Mock

  alias BcInvestiments.Rates
  alias BcInvestiments.Rates.{Selic, Ipca, Poupanca, Cdi}
  alias BcInvestiments.{SelicMock, IpcaMock, PoupancaMock, CdiMock}

  describe "rates" do
    test "get selic successfully" do
      with_mock HTTPoison, [get: fn(params) -> SelicMock.get(params) end] do
        assert Rates.get_selic() === {:ok, %Selic{daily_rate: 6.4, date: ~D[2018-06-21], rate: 6.5}}
      end
    end

    test "not get selic with format error" do
      with_mock HTTPoison, [get: fn(params) -> SelicMock.get_with_incorrect_format_response(params) end] do
        assert Rates.get_selic() === {:error, :scraping}
      end
    end

    test "not get selic with http error" do
      with_mock HTTPoison, [get: fn(params) -> SelicMock.get_error_response(params) end] do
        assert Rates.get_selic() === {:error, :http}
      end
    end

    test "get ipca successfully" do
      with_mock HTTPoison, [get: fn(params) -> IpcaMock.get(params) end] do
        assert Rates.get_ipca() === {:ok, %Ipca{last_12_months_rate: 2.86}}
      end
    end

    test "not get ipca with format error" do
      with_mock HTTPoison, [get: fn(params) -> IpcaMock.get_with_incorrect_format_response(params) end] do
        assert Rates.get_ipca() === {:error, :scraping}
      end
    end

    test "not get ipca with http error" do
      with_mock HTTPoison, [get: fn(params) -> IpcaMock.get_error_response(params) end] do
        assert Rates.get_ipca() === {:error, :http}
      end
    end

    test "get poupanca successfully" do
      with_mock HTTPoison, [get: fn(params) -> PoupancaMock.get(params) end] do
        assert Rates.get_poupanca() === {:ok, %Poupanca{monthly_rate: 0.3715}}
      end
    end

    test "not get poupanca with format error" do
      with_mock HTTPoison, [get: fn(params) -> PoupancaMock.get_with_incorrect_format_response(params) end] do
        assert Rates.get_poupanca() === {:error, :scraping}
      end
    end

    test "not get poupanca with http error" do
      with_mock HTTPoison, [get: fn(params) -> PoupancaMock.get_error_response(params) end] do
        assert Rates.get_poupanca() === {:error, :http}
      end
    end

    test "get cdi successfully" do
      with_mock HTTPoison, [get: fn(params) -> CdiMock.get(params) end] do
        assert Rates.get_cdi() === {:ok, %Cdi{over: 6.39}}
      end
    end

    test "not get cdi with format error" do
      with_mock HTTPoison, [get: fn(params) -> CdiMock.get_with_incorrect_format_response(params) end] do
        assert Rates.get_cdi() === {:error, :scraping}
      end
    end

    test "not get cdi with http error" do
      with_mock HTTPoison, [get: fn(params) -> CdiMock.get_error_response(params) end] do
        assert Rates.get_cdi() === {:error, :http}
      end
    end
  end

end
