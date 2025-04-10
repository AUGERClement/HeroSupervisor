# SupervisorHero

Small toy application to demonstrate how to use a DynamicSupervisor with a Registry (see https://hexdocs.pm/elixir/1.12/GenServer.html#module-name-registration)

## How to use

iex -S mix to start the app in interactive mode

```elixir
{:ok, _pid} = MyApplication.start()
HeroSupervisor.init(nil)
ryu = %Hero{}
elric = %Hero{name: "Elric", age: 20}
HeroSupervisor.join(ryu) # return {:ok, pid}
HeroSupervisor.join(ryu) # return {:already_on_quest, pid}
```
