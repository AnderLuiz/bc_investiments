defmodule BcInvestiments.PoupancaMock do

  def get(_params) do
    { :ok, successful_response() }
  end

  def get_with_incorrect_format_response(_params) do
    { :ok, incorrect_format_response() }
  end

  def get_error_response(_params) do
    { :ok, error_response() }
  end

  defp successful_response() do
    %HTTPoison.Response{
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:40:35-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_POUPANCA</id>\r\n    <title type=\"text\">INDICADOR_POUPANCA</title>\r\n    <updated>2018-06-21T00:00:00-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/POUPANCA\" />\r\n    <content type=\"html\">&lt;div id=rate&gt;&lt;div id=value&gt;0,3715&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"fbe8ad12-dbf4-4a6a-baba-43a3dfcba5ae\""},
         {"Date", "Fri, 22 Jun 2018 19:40:35 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       request_url: "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/poupanca",
       status_code: 200
     }
  end

  defp incorrect_format_response() do
    %HTTPoison.Response{
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:40:35-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_POUPANCA</id>\r\n    <title type=\"text\">INDICADOR_POUPANCA</title>\r\n    <updated>2018-06-21T00:00:00-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/POUPANCA\" />\r\n    <contenterror type=\"html\">&lt;div id=rate&gt;&lt;div id=value&gt;0,3715&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"fbe8ad12-dbf4-4a6a-baba-43a3dfcba5ae\""},
         {"Date", "Fri, 22 Jun 2018 19:40:35 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       request_url: "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/poupanca",
       status_code: 200
     }
  end

  defp error_response() do
    %HTTPoison.Response{
       body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T16:40:35-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_POUPANCA</id>\r\n    <title type=\"text\">INDICADOR_POUPANCA</title>\r\n    <updated>2018-06-21T00:00:00-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/POUPANCA\" />\r\n    <content type=\"html\">&lt;div id=rate&gt;&lt;div id=value&gt;0,3715&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"fbe8ad12-dbf4-4a6a-baba-43a3dfcba5ae\""},
         {"Date", "Fri, 22 Jun 2018 19:40:35 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
       request_url: "http://conteudo.bcb.gov.br/api/feed/pt-br/PAINEL_INDICADORES/poupanca",
       status_code: 500
    }
  end
end
