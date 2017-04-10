defmodule FizzBadd.StatementWrapper do
  @moduledoc """
  Module providing basic functionality for wrapping a list of statements.
  """

  @indent "  "
  @separator "; "
  @width 120

  @doc """
  Naively wrap the given statements.

  As many statements as possible are packed onto each line. Formatting can be
  controlled using the optional parameters:
  - `indent`: "  "
  - `separator: "; "
  - `width`: 120

  ## Examples

      iex> FizzBadd.StatementWrapper.wrap(["a()", "b()", "c()"])
      "  a(); b(); c()"

      iex> FizzBadd.StatementWrapper.wrap(["a()", "b()", "c()"], indent: "# ")
      "# a(); b(); c()"

      iex> FizzBadd.StatementWrapper.wrap(["a()", "b()", "c()"], separator: " or ")
      "  a() or b() or c()"

      iex> FizzBadd.StatementWrapper.wrap(["a()", "b()", "c()"], width: 10)
      "  a(); b()
        c()"
  """
  def wrap(lines, opts \\ []) do
    options = Map.merge(default_options(), Enum.into(opts, %{}))

    lines
    |> do_reversed_wrap([], options)
    |> Enum.reverse
    |> Enum.join("\n")
  end

  defp do_reversed_wrap([], reversed_output, _) do
    reversed_output
  end

  defp do_reversed_wrap([statement | remaining], [], options) do
    line = options.indent <> statement

    do_reversed_wrap(remaining, [line], options)
  end

  defp do_reversed_wrap([statement | remaining], [current_line | previous_lines], options) do
    if appendable?(current_line, statement, options) do
      line = [current_line, statement]
      |> Enum.join(options.separator)

      do_reversed_wrap(remaining, [line | previous_lines], options)
    else
      new_line = options.indent <> statement
      do_reversed_wrap(remaining, [new_line | [current_line | previous_lines]], options)
    end
  end

  defp default_options do
    %{indent: @indent, separator: @separator, width: @width}
  end

  defp appendable?(current_line, next_statement, options) do
    new_length =
      [current_line, options.separator, next_statement]
      |> Enum.map(&String.length/1)
      |> Enum.sum

    new_length <= options.width
  end
end
