defmodule Aoc201901 do
  def part1() do
    all_modules()
    |> Enum.map(&calc_fuel_required/1)
    |> Enum.sum
  end

  def part2() do
    all_modules()
    |> Enum.map(&fuel_for_fuel(&1, 0))
    |> Enum.sum
  end

  def all_modules do
    File.stream!(Aoc.input_file(2019, 1))
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end

  def calc_fuel_required(mod), do: max(div(mod, 3) - 2, 0)

  def fuel_for_fuel(mod, acc) when mod <= 0 do
    acc
  end

  def fuel_for_fuel(mod, acc) do
    mod_fuel = calc_fuel_required(mod)
    fuel_for_fuel(mod_fuel, acc + mod_fuel)
  end
end
