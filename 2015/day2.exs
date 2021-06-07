# https://adventofcode.com/2015/day/2

defmodule Elves do
  def open_file(path) do
    { :ok, file } = File.read(path)
    String.split(file, "\n")
  end

  def split_dimensions(dimensions) do
    String.split(dimensions, "x")
    |> Enum.map(fn dimension -> String.to_integer(dimension) end)
  end

  def calc_needed_paper([l, w, h]) do
    sides = [l * w, w * h, h * l]
    sides
    |> Enum.reduce(Enum.min(sides), fn x, acc -> 2 * x + acc end)
  end

  def calc_needed_ribbon(dimensions) do
    wrap = dimensions
    |> Enum.sort(:asc)
    |> Enum.take(2)
    |> Enum.reduce(0, fn x, acc -> x + x + acc end)

    bow = dimensions
    |> Enum.reduce(1, fn x, acc -> x * acc end)

    wrap + bow
  end
end

input = Elves.open_file("day2-input.txt")
|> Enum.map(fn dimensions -> Elves.split_dimensions(dimensions) end)

input
|> Enum.map(fn dimensions -> Elves.calc_needed_paper(dimensions) end)
|> Enum.sum()
|> IO.puts()

input
|> Enum.map(fn dimensions -> Elves.calc_needed_ribbon(dimensions) end)
|> Enum.sum()
|> IO.puts()
