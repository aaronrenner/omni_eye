defmodule Eye.BarcodeScanner do
  @moduledoc false

  alias __MODULE__.Server

  defdelegate child_spec(opts), to: Server

  def next_scan(timeout \\ 10_000) do
    GenServer.call(Server, :next_scan, timeout)
  end
end
