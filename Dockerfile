# Use an official Elixir runtime as a parent image
FROM elixir:latest

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

RUN mix local.rebar --force

# Install dependencies
RUN mix deps.get

# Compile the project
RUN mix do compile

CMD ["mix", "phx.server"]