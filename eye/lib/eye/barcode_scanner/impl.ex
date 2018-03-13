defmodule Eye.BarcodeScanner.Impl do
  @moduledoc false

  alias Eye.Camera

  def next_scan() do
    {:ok, symbols} =
      Camera.next_frame()
      |> Zbar.scan()

    symbols
  end
end
