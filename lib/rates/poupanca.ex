defmodule BcInvestiments.Rates.Poupanca do
  @moduledoc """
    Representação do rendimento da poupança
  """
  
  defstruct monthly_rate: nil

  @type t :: %__MODULE__{
            monthly_rate: float | nil
  }

  @spec new(float) :: t
  def new(monthly_rate) do
    %__MODULE__{
      monthly_rate: monthly_rate,
    }
  end
end
