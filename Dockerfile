FROM elixir:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

# https://www.youtube.com/watch?v=ZRgp6mvSCaY&ab_channel=TheXRSpace