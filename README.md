# BcInvestiments

Simples biblioteca para obter os dados das taxas brasileiras. Atualmente, selic, ipca e poupança.

[![Hex.pm](https://img.shields.io/hexpm/v/bc_investiments.svg?style=plastic)](https://hex.pm/packages/bc_investiments)
[![Travis](https://img.shields.io/travis/AnderLuiz/bc_investiments.svg?style=plastic)](https://travis-ci.org/AnderLuiz/bc_investiments)
[![Inline docs](http://inch-ci.org/github/anderluiz/bc_investiments.svg)](http://inch-ci.org/github/anderluiz/bc_investiments)

# Uso

## Selic

```elixir
iex(1)> BcInvestiments.Rates.get_selic()
{:ok, %BcInvestiments.Rates.Selic{daily_rate: 6.4, date: ~D[2018-06-21], rate: 6.5}}
```

## IPCA

```elixir
iex(1)> BcInvestiments.Rates.get_ipca()
{:ok, %BcInvestiments.Rates.Ipca{last_12_months_rate: 2.86}}
```

## CDI

```elixir
iex(1)> BcInvestiments.Rates.get_cdi()
{:ok, %BcInvestiments.Rates.Cdi{over: 6.39}}
```

## Poupança

```elixir
iex(1)> BcInvestiments.Rates.get_poupanca()
{:ok, %BcInvestiments.Rates.Poupanca{monthly_rate: 0.3715}}
```


# Instalação

Esta biblioteca utiliza o floki, então:
Instale o rust.

```
curl https://sh.rustup.rs -sSf | sh

mix deps.get
```

Adicione a configuração do parser ao seu 'config.exs'
```elixir
config :floki, :html_parser, Floki.HTMLParser.Html5ever
```

Adicione a dependencia:

```elixir
def deps do
  [
    {:bc_investiments, "~> 0.3.1"}
  ]
end
```

Em caso de erro ao compilar referente a dependencia html5ever, tente:

```
cd deps/html5ever/native/html5ever_nif/
cargo update
```
