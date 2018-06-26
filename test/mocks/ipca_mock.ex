defmodule BcInvestiments.IpcaMock do
  
  @moduledoc """
    Mock para testes das requests para obter a taxa do IPCA
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
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:24:58-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_INFLACAO</id>\r\n    <title type=\"text\">Taxa de Inflação</title>\r\n    <updated>2018-06-22T16:21:01-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/INFLACAO\" />\r\n    <content type=\"html\">&lt;div id=label&gt;Meta&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;4&lt;/div&gt;&lt;div id=obs&gt;(+/- 1,5 p.p.)&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Acumulada&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;2,86&lt;/div&gt;&lt;div id=obs&gt;(período de 12 meses - IPCA)&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"00444304-9600-4223-92f9-8c67236d3295\""},
         {"Date", "Fri, 22 Jun 2018 19:24:57 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       status_code: 200
     }
  end

  defp incorrect_format_response() do
    %HTTPoison.Response{
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:24:58-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_INFLACAO</id>\r\n    <title type=\"text\">Taxa de Inflação</title>\r\n    <updated>2018-06-22T16:21:01-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/INFLACAO\" />\r\n    <contenterror type=\"html\">&lt;div id=label&gt;Meta&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;4&lt;/div&gt;&lt;div id=obs&gt;(+/- 1,5 p.p.)&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Acumulada&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;2,86&lt;/div&gt;&lt;div id=obs&gt;(período de 12 meses - IPCA)&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"00444304-9600-4223-92f9-8c67236d3295\""},
         {"Date", "Fri, 22 Jun 2018 19:24:57 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       status_code: 200
     }
  end

  defp error_response() do
    %HTTPoison.Response{
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:24:58-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_INFLACAO</id>\r\n    <title type=\"text\">Taxa de Inflação</title>\r\n    <updated>2018-06-22T16:21:01-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/INFLACAO\" />\r\n    <content type=\"html\">&lt;div id=label&gt;Meta&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;4&lt;/div&gt;&lt;div id=obs&gt;(+/- 1,5 p.p.)&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Acumulada&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=value&gt;2,86&lt;/div&gt;&lt;div id=obs&gt;(período de 12 meses - IPCA)&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"00444304-9600-4223-92f9-8c67236d3295\""},
         {"Date", "Fri, 22 Jun 2018 19:24:57 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       status_code: 500
     }
  end
end
