defmodule BcInvestiments.Rates.Cdi do
  @moduledoc """
    Representação do CDI
  """
  
  defstruct over: nil

  @type t :: %__MODULE__{
            over: float | nil
  }

  @spec new(float) :: t
  def new(over) do
    %__MODULE__{
      over: over,
    }
  end
end
