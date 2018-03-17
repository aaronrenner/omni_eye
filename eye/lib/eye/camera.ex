defmodule Eye.Camera do
  @moduledoc """
  Public API for working with the camera
  """
  alias Eye.Configuration
  alias __MODULE__.Server

  @doc false
  defdelegate child_spec(opts), to: Server

  @spec get_config :: Configuration.t
  def get_config do
    GenServer.call(Server, :get_config)
  end

  @spec set_size(non_neg_integer(), non_neg_integer()) ::
    :ok | {:error, :invalid_size}
  def set_size(width, height) do
    GenServer.call(Server, {:set_size, width, height})
  end

  @spec set_rotation(non_neg_integer()) ::
    :ok | {:error, :invalid_rotation_angle}
  def set_rotation(angle) do
    GenServer.call(Server, {:set_rotation, angle})
  end

  defdelegate next_frame(), to: Picam
end
