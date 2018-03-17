defmodule Eye.Camera.Impl do
  @moduledoc false
  alias Eye.Configuration

  require Logger

  @spec set_size(Configuration.t(), non_neg_integer, non_neg_integer) ::
          {:ok, Configuration.t()} | {:error, :invalid_size}
  def set_size(%Configuration{} = config, width, height) do
    new_config = %Configuration{config | size: %{width: width, height: height}}

    with :ok <- apply_config(new_config) do
      {:ok, new_config}
    end
  end

  @spec set_rotation(Configuration.t(), non_neg_integer) ::
          {:ok, Configuration.t()} | {:error, :invalid_rotation_angle}
  def set_rotation(%Configuration{} = config, rotation) do
    new_config = %Configuration{config | rotation: rotation}

    with :ok <- apply_config(new_config) do
      {:ok, new_config}
    end
  end

  @spec apply_config(Configuration.t()) :: Configuration.t()
  def apply_config(%Configuration{} = config) do
    Logger.info("Configuring camera")

    with :ok <- apply_size(config),
         :ok <- apply_rotation(config) do
      :ok
    end
  end

  defp apply_size(%Configuration{size: %{width: width, height: height}}) do
    Picam.set_size(width, height)
  end

  defp apply_rotation(%Configuration{rotation: rotation}) do
    Picam.set_rotation(rotation)
  end
end
