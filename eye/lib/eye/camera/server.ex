defmodule Eye.Camera.Server do
  @moduledoc false
  use GenServer

  alias Eye.Camera.Impl
  alias Eye.Configuration

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    config = %Configuration{}
    :ok = Impl.apply_config(config)
    {:ok, config}
  end

  def handle_call(:get_config, _from, config) do
    {:reply, config, config}
  end

  def handle_call({:set_size, width, height}, _from, config) do
    case Impl.set_size(config, width, height) do
      {:ok, config} ->
        {:reply, :ok, config}
      {:error, :invalid_size} ->
        {:reply, {:error, :invalid_size}, config}
    end
  end

  def handle_call({:set_rotation, angle}, _from, config) do
    case Impl.set_rotation(config, angle) do
      {:ok, config} ->
        {:reply, :ok, config}
      {:error, :invalid_rotation_angle} ->
        {:reply, {:error, :invalid_rotation_angle}, config}
    end
  end
end
