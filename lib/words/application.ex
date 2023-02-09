defmodule Words.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Words.Repo,
      # Start the Telemetry supervisor
      WordsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Words.PubSub},
      # Start the Endpoint (http/https)
      WordsWeb.Endpoint
      # Start a worker by calling: Words.Worker.start_link(arg)
      # {Words.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Words.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WordsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
