defmodule ChatDemoWeb.RoomChannel do
  use ChatDemoWeb, :channel

  alias ChatDemo.Chats

  @impl true
  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

end
