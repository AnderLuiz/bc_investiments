# BcInvestiments

Simples biblioteca para obter os dados das taxas brasileiras. Atualmente, selic, ipca e poupança.

## Installation

Esta biblioteca utiliza o floki.
Instale o rust.

```
curl https://sh.rustup.rs -sSf | sh
cd deps/html5ever/native/html5ever_nif
cargo update
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
