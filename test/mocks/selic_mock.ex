defmodule BcInvestiments.SelicMock do

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
        body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T15:33:34-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_JUROS</id>\r\n    <title type=\"text\">Taxa Selic</title>\r\n    <updated>2018-06-22T15:31:02-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/JUROS\" />\r\n    <content type=\"html\">&lt;div id=label&gt;Meta:&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=ratevalue&gt;6,5&lt;/div&gt;&lt;div=ratedate&gt;20/06/2018&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Diária:&lt;/div&gt;&lt;div id=dailyrate&gt;&lt;div id=dailyratevalue&gt;6,4&lt;/div&gt;&lt;div id=dailyratedate&gt;21/06/2018&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"635f9cb1-4780-42af-a575-096afad21c70\""},
         {"Date", "Fri, 22 Jun 2018 18:33:33 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
     status_code: 200
   }
  end

  defp incorrect_format_response() do
    %HTTPoison.Response{
        body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T15:33:34-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_JUROS</id>\r\n    <title type=\"text\">Taxa Selic</title>\r\n    <updated>2018-06-22T15:31:02-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/JUROS\" />\r\n    <contenterror type=\"html\">&lt;div id=label&gt;Meta:&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=ratevalue&gt;6,5&lt;/div&gt;&lt;div=ratedate&gt;20/06/2018&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Diária:&lt;/div&gt;&lt;div id=dailyrate&gt;&lt;div id=dailyratevalue&gt;6,4&lt;/div&gt;&lt;div id=dailyratedate&gt;21/06/2018&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
       headers: [
         {"Cache-Control", "max-age=1"},
         {"Content-Type", "application/atom+xml"},
         {"ETag", "\"635f9cb1-4780-42af-a575-096afad21c70\""},
         {"Date", "Fri, 22 Jun 2018 18:33:33 GMT"},
         {"Connection", "close"},
         {"Transfer-Encoding", "chunked"}
       ],
     status_code: 200
   }
  end

  defp error_response() do
    %HTTPoison.Response{
        body: "\uFEFF<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\r\n  <title type=\"text\">Economia e finanças</title>\r\n  <subtitle type=\"text\"></subtitle>\r\n  <id>painel_indicadores</id>\r\n  <updated>2018-06-22T15:33:34-03:00</updated>\r\n  <category term=\"Economia e finanças\" />\r\n  <category term=\"\" />\r\n  <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores\" />\r\n  <entry>\r\n    <id>painel_indicadores_JUROS</id>\r\n    <title type=\"text\">Taxa Selic</title>\r\n    <updated>2018-06-22T15:31:02-03:00</updated>\r\n    <link rel=\"alternate\" href=\"http://conteudo.bcb.gov.br//api/feed/pt-br/painel_indicadores/JUROS\" />\r\n    <contenterror type=\"html\">&lt;div id=label&gt;Meta:&lt;/div&gt;&lt;div id=rate&gt;&lt;div id=ratevalue&gt;6,5&lt;/div&gt;&lt;div=ratedate&gt;20/06/2018&lt;/div&gt;&lt;/div&gt;&lt;div id=label&gt;Diária:&lt;/div&gt;&lt;div id=dailyrate&gt;&lt;div id=dailyratevalue&gt;6,4&lt;/div&gt;&lt;div id=dailyratedate&gt;21/06/2018&lt;/div&gt;&lt;/div&gt;</content>\r\n  </entry>\r\n</feed>",
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
