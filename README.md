# BcInvestiments

Simples biblioteca para obter os dados das taxas brasileiras. Atualmente, selic, ipca e poupança.

[![Travis](https://img.shields.io/travis/AnderLuiz/bc_investiments.svg?style=plastic)](https://travis-ci.org/AnderLuiz/bc_investiments)


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

```

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bc_investiments` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bc_investiments, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bc_investiments](https://hexdocs.pm/bc_investiments).
