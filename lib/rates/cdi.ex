defmodule BcInvestiments.Rates.Cdi do
  defstruct over: nil

  @moduledoc """
    Representação do CDI
  """

  @type t :: %__MODULE__{
            over: float | nil
  }

  @spec new(float) :: t
  def new(last_12_months_rate) do
    %__MODULE__{
      over: last_12_months_rate,
    }
  end
end
