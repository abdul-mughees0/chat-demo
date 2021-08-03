defmodule ChatDemoWeb.PageController do
  use ChatDemoWeb, :controller

  alias ChatDemo.Chats

  def index(conn, _params) do
    messages = Chats.list_messages()
    render(conn, "index.html", messages: messages)
  end
end
