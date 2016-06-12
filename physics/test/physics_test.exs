defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct" do
    11.2 = Physics.Rocketry.escape_velocity(:earth)
  end

  test "escape velocity of planet x is correct" do
    1.0 = %{mass: 4.0e22, radius: 6.21e6} |> Physics.Rocketry.escape_velocity
  end
end
