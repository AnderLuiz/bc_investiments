defmodule BcInvestiments.MixProject do
  use Mix.Project

  @version "0.3.2"
  @github "https://github.com/AnderLuiz/bc_investiments"

  def project do
    [
      app: :bc_investiments,
      version: @version,
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      source_url: @github,
      docs: docs(),
      package: package(),
      description: description(),
      deps: deps()
    ]
  end

  defp description do
    """
    Lib para obter as taxas selic, ipca e poupança
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger,:httpoison]
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @github,
      extras: [
        "README.md"
      ]
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      name: :bc_investiments,
      maintainers: ["Anderson Luiz Vendruscolo"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @github}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev]},
      {:inch_ex, only: [:docs]},
      {:mock, "~> 0.3.0", only: [:test]},
      {:floki, "~> 0.20.0"},
      {:html5ever, "~> 0.5.0"},
      {:httpoison, ">= 0.9.0"},
    ]
  end

  defp elixirc_paths(:test), do: ["lib","test/mocks"]
  defp elixirc_paths(_), do: ["lib"]

end
