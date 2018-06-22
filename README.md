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

```elixir
def deps do
  [
    {:bc_investiments, "~> 0.3.0"}
  ]
end
```
