defmodule BcInvestiments.Rates.Cdi do
  defstruct over: nil

  @moduledoc """
    Representação do CDI
  """

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
