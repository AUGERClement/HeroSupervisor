#https://gist.github.com/sultaniman/cb61797b61b83de17bcb27f136d33e4d

# Your actual dynamic worker
defmodule HeroWorker do
  use GenServer, restart: :transient
  #alias Hero

  def init(init_arg) do
    {:ok, init_arg}
  end

  # Client
  def start_link(%Hero{} = hero), do:
    GenServer.start_link(__MODULE__, hero, name: proc_name(hero))

  defp proc_name(%Hero{name: name}), do:
    {:via, Registry, {HeroRegistry, "#{name}", name}}
end

# Supervisor manages your workers
defmodule HeroSupervisor do
  use DynamicSupervisor
  #alias Awesome.Worker

  # Client
  def start_link(arg), do:
    DynamicSupervisor.start_link(__MODULE__, arg, name: __MODULE__)

  def join(%Hero{} = hero) do
    case Registry.lookup(HeroRegistry, hero.name) do
      [] -> DynamicSupervisor.start_child(__MODULE__, {HeroWorker, hero}) #Unregistered Hero
      [{pid, _name} | _] -> {:already_on_quest, pid} # rest is [] since keys are unique in this registry
    end
  end

  # Server
  def init(_arg), do:
    DynamicSupervisor.init(strategy: :one_for_one)
end
