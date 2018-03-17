defmodule Eye.Camera.ImplTest do
  use ExUnit.Case, async: true

  alias Eye.Camera.Impl
  alias Eye.Configuration

  @moduletag :capture_log

  test "set_size/3 with a valid size" do
    config = %Configuration{}
    {:ok, new_config} = Impl.set_size(config, 720, 640)

    assert %{
      size: %{width: 720, height: 640}
    } = new_config
  end

  test "set_size/3 with an invalid size" do
    config = %Configuration{}
    assert {:error, :invalid_size} =
      Impl.set_size(config, -700, -400)
  end

  test "set_rotation/3 with valid rotation" do
    config = %Configuration{}
    {:ok, new_config} = Impl.set_rotation(config, 90)

    assert %{
      rotation: 90
    } = new_config
  end

  test "set_rotation/3 with an invalid rotation" do
    config = %Configuration{}
    assert {:error, :invalid_rotation_angle} =
      Impl.set_rotation(config, 34)
  end
end
