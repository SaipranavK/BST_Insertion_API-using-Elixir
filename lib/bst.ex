defmodule Bst do

  use Application 
    require Logger

    def start(_type, _args) do
      children = [
        Plug.Cowboy.child_spec(
          scheme: :http, 
          plug: Bst.Router,
          options: [port: 8080]
        )
      ]

      Logger.info "API Running"

      Supervisor.start_link(children, strategy: :one_for_one)
      
    end
end