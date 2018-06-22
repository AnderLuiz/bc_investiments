defmodule BcInvestiments.Rates.Ipca do
  defstruct last_12_months_rate: nil

  @moduledoc """
    Representação do IPCA
  """

  @type t :: %__MODULE__{
            last_12_months_rate: float | nil
  }

  @spec new(float) :: t
  def new(last_12_months_rate) do
    %__MODULE__{
      last_12_months_rate: last_12_months_rate,
    }
  end
end
