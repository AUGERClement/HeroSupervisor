defmodule SupervisorHeroTest do
  use ExUnit.Case
  doctest SupervisorHero

  test "greets the world" do
    assert SupervisorHero.hello() == :world
  end
end
