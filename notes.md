### NOTES

1. Phoenix:

    - web development framework for Elixir (similar to Django for Python)
    - follows the MVC design pattern (Model-View-Controller)
    - work with Ecto library for database interactions
    - used to build web apps and APIs

2. Absinthe:

    - GraphQL implementation for Elixir
    - allow building server using GraphQL as a query language
    - Structures:
        - GraphQL schemas: to describe the API's data structure
        - Resolvers: functions to handle how a schema is resolved when requested by a client
                     and are responsible for fetching data from a database
        - Plug integration: integrate well with Phoenix to serve GraphQL requests over HTTP

3. Summary:

    - Phoenix to handle requests, routing
    - Absinthe to add GraphQL support
    - Together they create a web app with GraphQL API
