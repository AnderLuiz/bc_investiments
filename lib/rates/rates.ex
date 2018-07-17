defmodule BcInvestiments.Rates do
  @moduledoc """
    Taxas selic, ipca, cdi e poupança
  """

  alias BcInvestiments.Rates.{Selic, Ipca, Poupanca, Cdi}

  @doc """
    Retorna a taxa selic do site do banco central

    ## Exemplos

        iex> BcInvestiments.Rates.get_selic()
        {:ok, %Selic{daily_rate: 6.4, date: ~D[2018-06-21], rate: 6.5}
  """
  @spec get_selic() :: {:ok, Selic.t} | {:error, :scraping} | {:error, :http}
  def get_selic() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/juros" do
      {:ok, %{body: html, status_code: 200}} ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [rate_div, daily_rate_div, date_div] <-  Floki.find(content, "body div div"),
               {rate_selic, _} <-  rate_div
                                  |> Floki.text()
                                  |> String.replace(",", ".")
                                  |> Float.parse(),
               {daily_rate_selic, _} <-  daily_rate_div
                                          |> Floki.text()
                                          |> String.replace(",", ".")
                                          |> Float.parse(),
               str_date = Floki.text(date_div),
               date = Date.from_iso8601!("#{String.slice(str_date,6,4)}-#{String.slice(str_date,3,2)}-#{String.slice(str_date,0,2)}")
          do
            {:ok, Selic.new(rate_selic, daily_rate_selic, date)}
          else
            _ ->  {:error, :scraping}
          end
      _ -> {:error, :http}
    end
  end

  @doc """
    Retorna o IPCA do site do banco central

    ## Exemplos

        iex> BcInvestiments.Rates.get_ipca()
        {:ok, %Ipca{last_12_months_rate: 2.86}
  """
  @spec get_ipca() :: {:ok, Ipca.t} | {:error, :scraping} | {:error, :http}
  def get_ipca() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/inflacao" do
      {:ok, %{body: html, status_code: 200}} ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [_, _, div, _] = Floki.find(content, "body div div"),
               {ipca, _} <-  div
                            |> Floki.text()
                            |> String.replace(",", ".")
                            |> Float.parse()
          do
            {:ok, Ipca.new(ipca)}
          else
            _ ->  {:error, :scraping}
          end
      _ -> {:error, :http}
    end
  end

  @doc """
    Retorna o a taxa CDI atual

    ## Exemplos

        iex> BcInvestiments.Rates.get_cdi()
        {:ok, %Cdi{over: 6.39}
  """
  @spec get_cdi() :: {:ok, Cdi.t} | {:error, :scraping} | {:error, :http}
  def get_cdi() do
    case HTTPoison.get "https://www.cetip.com.br/" do
      {:ok, %{body: html, status_code: 200}} ->
          with spans <- Floki.find(html, "span"),
               {"span",
               [{"id", "ctl00_Banner_lblTaxDI"}],
               [str_cdi]} <- Enum.find(spans, fn(element) ->
                                             match?({"span", [{"id", "ctl00_Banner_lblTaxDI"}], [_]}, element)
                                           end),
               {cdi, _} <- str_cdi
                          |> String.replace(",", ".")
                          |> Float.parse
          do
            {:ok, Cdi.new(cdi)}
          else
            _ ->  {:error, :scraping}
          end
      _ -> {:error, :http}
    end
  end

  @doc """
    Retorna o a taxa de rendimento da poupança do site do banco central

    ## Exemplos

        iex> BcInvestiments.Rates.get_poupanca()
        {:ok, %Poupanca{monthly_rate: 0.3715}
  """
  @spec get_poupanca() :: {:ok, Poupanca.t} | {:error, :scraping} | {:error, :http}
  def get_poupanca() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/poupanca" do
      {:ok, %{body: html, status_code: 200}} ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [div] = Floki.find(content, "body div div"),
               {poupanca, _} <-  div
                                |> Floki.text()
                                |> String.replace(",", ".")
                                |> Float.parse()
          do
            {:ok, Poupanca.new(poupanca)}
          else
            _ ->  {:error, :scraping}
          end
      _ -> {:error, :http}
    end
  end

end
