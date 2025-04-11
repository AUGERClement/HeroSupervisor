# SupervisorHero

Small toy application to demonstrate how to use a DynamicSupervisor with a Registry (see https://hexdocs.pm/elixir/1.12/GenServer.html#module-name-registration)

## How to use

iex -S mix to start the app in interactive mode

```elixir
{:ok, _pid} = MyApplication.start() # Necessary to start the registry
HeroSupervisor.init("Ilias") # Will print 'Ilias started supervising heros'
luka = %Hero{name: "Luka", age: 18, weapon: "Halo Night Custom"}
henrich = %Hero{name: "heinrich", age: 20, weapon: "Angel Halo"}
HeroSupervisor.join(luka) # return {:ok, pid}
HeroSupervisor.join(luka) # return {:already_on_quest, pid}
```

