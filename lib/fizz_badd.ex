defmodule FizzBadd do
  @moduledoc """
  Documentation for FizzBadd.
  """

  alias __MODULE__.ShittyFizzBuzz, as: ShittyFizzBuzz
  alias __MODULE__.StatementWrapper, as: StatementWrapper

  def generate(n) when not is_integer(n) do
    raise ArgumentError, "expects Integer, not `#{n}`"
  end
  def generate(n) when n < 1 do
    raise ArgumentError, "can't generate negative lines (#{n})"
  end
  def generate(n) do """
    defmodule FizzBuzz do
    #{moduledoc()}
    #{integer_guard()}
    #{positive_guard()}
    #{in_range_guard(n)}
      def fizz_buzz(n) do
    #{statements(n)}
      end
    end
    """
  end

  defp moduledoc, do: """
    @moduledoc \"""
    A Fizz Buzz implementation.
    \"""
  """

  defp integer_guard, do: """
    def fizz_buzz(n) when not is_integer(n) do
      raise ArgumentError, "expects Integer, not `\#{n}`"
    end
  """

  defp positive_guard, do: """
    def fizz_buzz(n) when n < 1 do
      raise ArgumentError, "can't Fizz Buzz negative numbers (\#{n})"
    end
  """

  defp in_range_guard(n), do: """
    def fizz_buzz(n) when n > #{n} do
      raise ArgumentError, "Fizz Buzz not implemented beyond #{n} (\#{n})"
    end
  """

  def statements(n) do
    n
    |> ShittyFizzBuzz.statements
    |> StatementWrapper.wrap(indent: "    ")
  end
end
