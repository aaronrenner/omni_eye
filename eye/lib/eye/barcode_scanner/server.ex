defmodule Eye.BarcodeScanner.Server do
  @moduledoc false
  use GenServer

  alias Eye.BarcodeScanner.Impl

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    send(self(), :scan_next_frame)
    {:ok, []}
  end

  def handle_call(:next_scan, from, state) do
    {:noreply, [from | state]}
  end

  def handle_info(:scan_next_frame, state) do
    Impl.next_scan()
    |> dispatch(state)

    send(self(), :scan_next_frame)
    {:noreply, []}
  end

  defp dispatch(symbols, requests) do
    Enum.each(requests, &GenServer.reply(&1, symbols))
  end
end
