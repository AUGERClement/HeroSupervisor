# application.ex
defmodule MyApplication do
  # ...
  def start() do
    children = [
      {HeroSupervisor, ["The HeroSupervisor from MyApplication"]},
      {Registry, keys: :unique, name: HeroRegistry}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
