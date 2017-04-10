defmodule FizzBaddTest do
  use ExUnit.Case, async: true
  doctest FizzBadd

  test "won't generate empty implementations" do
    assert_raise ArgumentError, fn ->
      FizzBadd.generate(0)
    end
  end

  test "won't accept arguments out of range" do
    assert_raise ArgumentError, fn ->
      FizzBadd.generate(-1)
    end
  end

  test "generates the correct implementation given 1" do
    assert FizzBadd.generate(1) == """
    defmodule FizzBuzz do
      @moduledoc \"""
      A Fizz Buzz implementation.
      \"""

      def fizz_buzz(n) when not is_integer(n) do
        raise ArgumentError, "expects Integer, not `\#{n}`"
      end

      def fizz_buzz(n) when n < 1 do
        raise ArgumentError, "can't Fizz Buzz negative numbers (\#{n})"
      end

      def fizz_buzz(n) when n > 1 do
        raise ArgumentError, "Fizz Buzz not implemented beyond 1 (\#{n})"
      end

      def fizz_buzz(n) do
        if n == 1, do: IO.puts "1"
      end
    end
    """
  end

  test "generates the correct implementation given 2" do
    assert FizzBadd.generate(2) === """
    defmodule FizzBuzz do
      @moduledoc \"""
      A Fizz Buzz implementation.
      \"""

      def fizz_buzz(n) when not is_integer(n) do
        raise ArgumentError, "expects Integer, not `\#{n}`"
      end

      def fizz_buzz(n) when n < 1 do
        raise ArgumentError, "can't Fizz Buzz negative numbers (\#{n})"
      end

      def fizz_buzz(n) when n > 2 do
        raise ArgumentError, "Fizz Buzz not implemented beyond 2 (\#{n})"
      end

      def fizz_buzz(n) do
        if n >= 1, do: IO.write "1"; if n > 1, do: IO.write ", "; if n == 2, do: IO.puts "2"
      end
    end
    """
  end

  test "generates the correct implementation given 15" do
    assert FizzBadd.generate(15) === """
    defmodule FizzBuzz do
      @moduledoc \"""
      A Fizz Buzz implementation.
      \"""

      def fizz_buzz(n) when not is_integer(n) do
        raise ArgumentError, "expects Integer, not `\#{n}`"
      end

      def fizz_buzz(n) when n < 1 do
        raise ArgumentError, "can't Fizz Buzz negative numbers (\#{n})"
      end

      def fizz_buzz(n) when n > 15 do
        raise ArgumentError, "Fizz Buzz not implemented beyond 15 (\#{n})"
      end

      def fizz_buzz(n) do
        if n >= 1, do: IO.write "1"; if n > 1, do: IO.write ", "; if n >= 2, do: IO.write "2"; if n > 2, do: IO.write ", "
        if n >= 3, do: IO.write "Fizz"; if n > 3, do: IO.write ", "; if n >= 4, do: IO.write "4"
        if n > 4, do: IO.write ", "; if n >= 5, do: IO.write "Buzz"; if n > 5, do: IO.write ", "
        if n >= 6, do: IO.write "Fizz"; if n > 6, do: IO.write ", "; if n >= 7, do: IO.write "7"
        if n > 7, do: IO.write ", "; if n >= 8, do: IO.write "8"; if n > 8, do: IO.write ", "
        if n >= 9, do: IO.write "Fizz"; if n > 9, do: IO.write ", "; if n >= 10, do: IO.write "Buzz"
        if n > 10, do: IO.write ", "; if n >= 11, do: IO.write "11"; if n > 11, do: IO.write ", "
        if n >= 12, do: IO.write "Fizz"; if n > 12, do: IO.write ", "; if n >= 13, do: IO.write "13"
        if n > 13, do: IO.write ", "; if n >= 14, do: IO.write "14"; if n > 14, do: IO.write ", "
        if n == 15, do: IO.puts "Fizz Buzz"
      end
    end
    """
  end
end
