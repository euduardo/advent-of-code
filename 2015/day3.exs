# ^>v<

defmodule Houses do
  def take_direction(map, "^") do
    [map, [1]]
  end

  def take_direction(map, ">") do
    map ++ [1]
  end

  def take_direction(map, "<") do
    [1] ++ map
  end

  def take_direction(map, "v") do
    map
  end

  def take_direction(map, [head | tail]) do
    take_direction(map, head)
    |> take_direction(tail)
  end

  def take_direction(map, []) do
    map
  end
end

# input = String.graphemes("^>v<")
input = String.graphemes("^v^v^v^v^v")

Houses.take_direction([], input)
|> IO.inspect()
