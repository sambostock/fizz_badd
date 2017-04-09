defmodule FizzBadd.FizzBuzz do
  @moduledoc """
  Fizz Buzz implementation for internal use.
  """

  @doc """
  Produce the n-th value in the Fizz Buzz sequence.

  ## Examples

      iex> FizzBadd.FizzBuzz.fizz_buzz(1)
      "1"

      iex> FizzBadd.FizzBuzz.fizz_buzz(3)
      "Fizz"

      iex> FizzBadd.FizzBuzz.fizz_buzz(5)
      "Buzz"

      iex> FizzBadd.FizzBuzz.fizz_buzz(15)
      "Fizz Buzz"

  """
  def fizz_buzz(n) when rem(n, 15) == 0, do: "Fizz Buzz"
  def fizz_buzz(n) when rem(n, 5) == 0, do: "Buzz"
  def fizz_buzz(n) when rem(n, 3) == 0, do: "Fizz"
  def fizz_buzz(n), do: Integer.to_string(n)
end
