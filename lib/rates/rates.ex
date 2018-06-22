defmodule BcInvestiments.Rates do
  alias BcInvestiments.Rates.{Selic, Ipca, Poupanca}

  @moduledoc """
    Taxas selic, ipca e poupança
  """



  @doc """
    Retorna a taxa selic do site do banco central

    ## Exemplos

        iex> BcInvestiments.Rates.get_selic()
        {:ok, %Selic{daily_rate: 6.4, date: ~D[2018-06-21], rate: 6.5}
  """
  def get_selic() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/juros" do
      {:ok, %{body: html, status_code: 200} } ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [rate_div,daily_rate_div,date_div] <-  Floki.find(content, "body div div"),
               {rate_selic,_} <-  Floki.text(rate_div)
                                  |> String.replace(",",".")
                                  |> Float.parse,
               {daily_rate_selic, _ } <- Floki.text(daily_rate_div) |> String.replace(",",".") |> Float.parse,
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
  def get_ipca() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/inflacao" do
      {:ok, %{body: html, status_code: 200} } ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [_,_,div,_] = Floki.find(content, "body div div"),
               {ipca,_} <-  Floki.text(div)
                            |> String.replace(",",".")
                            |> Float.parse
          do
            {:ok, Ipca.new(ipca)}
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
  def get_poupanca() do
    case HTTPoison.get "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/poupanca" do
      {:ok, %{body: html, status_code: 200} } ->
          with [{_tag_name, _attributes, [content]}] <- Floki.find(html, "content"),
               [div] = Floki.find(content, "body div div"),
               {poupanca,_} <-  Floki.text(div)
                            |> String.replace(",",".")
                            |> Float.parse
          do
            {:ok, Poupanca.new(poupanca)}
          else
            _ ->  {:error, :scraping}
          end
      _ -> {:error, :http}
    end
  end

end
