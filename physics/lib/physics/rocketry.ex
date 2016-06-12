defmodule Converter do
  def to_nearest_tenth(value) do
    Float.ceil(value, 1)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_light_seconds({:miles, miles}) do
    (miles * 5.36819e-6) |> round_down
  end

  def to_light_seconds({:meters, meters}) do
    (meters * 3.335638620368e-9) |> round_down
  end

  def round_down(value) when is_float(value), do: trunc(value)
end

defmodule Physics.Rocketry do
  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6} |> escape_velocity
  end

  # Lowest velocity which a body must have in order to escape
  # the gravitational attraction of a particular planet or other object.
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.to_km
      |> Converter.to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius
      |> :math.sqrt
  end
end
