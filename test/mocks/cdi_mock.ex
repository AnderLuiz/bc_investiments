defmodule BcInvestiments.CdiMock do
  
  @moduledoc """
    Mock para testes das requests para obter a taxa do CDI
  """

  def get(_params) do
    {:ok, successful_response()}
  end

  def get_with_incorrect_format_response(_params) do
    {:ok, incorrect_format_response()}
  end

  def get_error_response(_params) do
    {:ok, error_response()}
  end

  defp successful_response() do
    %HTTPoison.Response{
     body: "<span id=\"ctl00_Banner_lblTaxDI\">6,39%</span></p>",
     headers: [
       {"Content-Type", "text/html; charset=utf-8"},
       {"Server", "Microsoft-IIS/8.5"},
       {"X-Powered-By", "ASP.NET"},
       {"Cache-Control", "private, max-age=133"},
       {"Date", "Sat, 23 Jun 2018 00:55:19 GMT"},
       {"Transfer-Encoding", "chunked"},
       {"Connection", "keep-alive"},
       {"Connection", "Transfer-Encoding"}
     ],
     status_code: 200
   }
  end

  defp incorrect_format_response() do
    %HTTPoison.Response{
     body: "<span id=\"ctl00_Banner_lblTaxDIerror\">6,39%</span></p>",
     headers: [
       {"Content-Type", "text/html; charset=utf-8"},
       {"Server", "Microsoft-IIS/8.5"},
       {"X-Powered-By", "ASP.NET"},
       {"Cache-Control", "private, max-age=133"},
       {"Date", "Sat, 23 Jun 2018 00:55:19 GMT"},
       {"Transfer-Encoding", "chunked"},
       {"Connection", "keep-alive"},
       {"Connection", "Transfer-Encoding"}
     ],
     status_code: 200
   }
  end

  defp error_response() do
    %HTTPoison.Response{
        body: "<span id=\"ctl00_Banner_lblTaxDI\">6,39%</span></p>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"635f9cb1-4780-42af-a575-096afad21c70\""},
         {"Date", "Fri, 22 Jun 2018 18:33:33 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
     status_code: 500
   }
  end
end
