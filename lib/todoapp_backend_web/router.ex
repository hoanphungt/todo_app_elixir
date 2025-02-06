defmodule TodoappBackendWeb.Router do
  use TodoappBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TodoappBackendWeb.Schema,
      interface: :simple,
      context: %{pubsub: TodoappBackendWeb.Endpoint}
  end
end
