# https://adventofcode.com/2015/day/4

defmodule AdventCoin do
  def find(text, zeros_count, i) do
    hash = hash(text <> Integer.to_string(i, 10))
    case String.starts_with?(hash, String.duplicate("0", zeros_count)) do
      true -> { i, hash }
      false -> find(text, zeros_count, i + 1)
    end
  end

  def hash(value), do: :crypto.hash(:md5, value) |> Base.encode16(case: :lower)
end

input = "yzbqklnj"

input
|> AdventCoin.find(5, 1)
|> IO.inspect()

input
|> AdventCoin.find(6, 1)
|> IO.inspect()
