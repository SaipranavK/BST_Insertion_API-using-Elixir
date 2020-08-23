defmodule Bst do
  use Application 
    
    require Logger

    def start(_type, _args) do

      # child processes
      children = [

        # register endpoint     
        Plug.Cowboy.child_spec(
          scheme: :http, 
          plug: Bst.Router,
          options: [port: 8080]
        )
      
      ]

      Logger.info "Running on 8080"
      Supervisor.start_link(children, strategy: :one_for_one)
      
    end
end