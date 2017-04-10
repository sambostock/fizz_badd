defmodule FizzBadd.ShittyFizzBuzz do
  @moduledoc """
  Module providing functionality for generating a shitty Fizz Buzz implementation.
  """

  alias FizzBadd.FizzBuzz, as: FizzBuzz

  import FizzBuzz, only: [fizz_buzz: 1]

  @doc """
  Generate a number of if statements able used as part of a Fizz Buzz implementation.

  The implementation consists of manually iterating over every number in a
  range, with each if statement controlling next output.

  Obviously this leads to an implementation with a maximum input size. This is
  intended, as it contributes to the _shittiness_.

  ## Examples

      iex> FizzBadd.ShittyFizzBuzz.statements(1)
      ["if n == 1, do: IO.puts \\"1\\""]

      iex> FizzBadd.ShittyFizzBuzz.statements(3)
      [
        "if n >= 1, do: IO.write \\"1\\"",
        "if n > 1, do: IO.write \\", \\"",
        "if n >= 2, do: IO.write \\"2\\"",
        "if n > 2, do: IO.write \\", \\"",
        "if n == 3, do: IO.puts \\"Fizz\\""
      ]
  """
  def statements(n) do
    1..n
    |> Enum.flat_map(&(statements_at_index(&1, n)))
  end

  @doc """
  Produce the statements generating the Fizz Buzz at `index` in the Fizz Buzz
  subsequence ending at `limit`.

  ## Examples
      iex> FizzBadd.ShittyFizzBuzz.statements_at_index(1, 1)
      ["if n == 1, do: IO.puts \\"1\\""]

      iex> FizzBadd.ShittyFizzBuzz.statements_at_index(1, 2)
      [
        "if n >= 1, do: IO.write \\"1\\"",
        "if n > 1, do: IO.write \\", \\""
      ]
  """
  def statements_at_index(index, limit) when index > limit do
    raise ArgumentError, "index (#{index}) must be less than limit #{limit}"
  end

  def statements_at_index(index, limit) when index == limit do
    [print_statement(index, final: true)]
  end

  def statements_at_index(index, limit) when index < limit do
    [
      print_statement(index),
      comma_statement(index)
    ]
  end

  defp print_statement(n, final: true) do
    "if n == #{n}, do: IO.puts \"#{fizz_buzz(n)}\""
  end

  defp print_statement(n) do
    "if n >= #{n}, do: IO.write \"#{fizz_buzz(n)}\""
  end

  defp comma_statement(n) do
    "if n > #{n}, do: IO.write \", \""
  end
end
