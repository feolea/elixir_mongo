# ElixirMongo

This is a little app just to try Elixir and Ecto with a Mongo DB.

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phx.server`

 You can also run your app inside IEx (Interactive Elixir) as:

    `$ iex -S mix phx.server`

Now you can visit [`localhost:4000/products`](http://localhost:4000/products) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

You need an instance of mongodb running at port 27017, if you do not want to install it on your machine, just use a docker one with:

  `$ docker run -p 27017:27017 --name mongo-3 -v ~/docker-mongo-3-data:/data/db -d mongo:3.4`

  and then:

  `$ docker start mongo-3`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## References

  * https://whitfin.io/using-mongodb-with-elixir-phoenix-and-ecto/

  In my case, to solve the dependencies issue I've used:

  `{:ecto, "~> 2.1.0", override: true}`

  Because at this time, the maximum version of ecto supported by mongodb_ecto was that.