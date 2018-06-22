defmodule BcInvestiments.Rates.Selic do
  defstruct rate: nil,
            daily_rate: nil,
            date: false

  @type t :: %__MODULE__{
            rate: float | nil,
            daily_rate: float | nil,
            date: Date.t
  }

  @spec new(float, float, Date.t) :: t
  def new(rate, daily_rate, date) do
    %__MODULE__{
      rate: rate,
      daily_rate: daily_rate,
      date: date
    }
  end
end
