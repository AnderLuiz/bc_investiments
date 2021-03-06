defmodule BcInvestiments.Rates.Ipca do
  @moduledoc """
    Representação do IPCA
  """
  
  defstruct last_12_months_rate: nil

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
