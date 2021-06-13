defmodule NiceString do
  def open_file(path) do
    { :ok, file } = File.read(path)
    String.split(file, "\n")
  end

  def is_nice_string?(string) do
    contains_three_vowels?(string) and
    contains_any_letter_twice_in_a_row?(string) and not
    contains_prohibited_strings(string)
  end

  def contains_three_vowels?(string) do
    vowels_count = string
    |> String.graphemes()
    |> Enum.count(fn letter -> letter =~ ~r/a|e|i|o|u/i end)
    vowels_count >= 3
  end

  def contains_any_letter_twice_in_a_row?(string) do
    string
    |> String.graphemes()
    |> MapSet.new()
    |> Enum.any?(fn l -> String.contains?(string, "#{l}#{l}") end)
  end

  def contains_prohibited_strings(string) do
    prohibited_strings = ["ab", "cd", "pq", "xy"]
    prohibited_strings
    |> Enum.any?(fn p -> String.contains?(string, p) end)
  end
end

inputs = NiceString.open_file("day5-input.txt")

inputs
|> Enum.count(fn input -> NiceString.is_nice_string?(input) end)
|> IO.puts()
