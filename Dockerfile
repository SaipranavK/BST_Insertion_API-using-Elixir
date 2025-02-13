FROM elixir:latest

# Create and set home directory
WORKDIR /saipranavk/bst

# Configure required environment
ENV MIX_ENV prod

# Install hex (Elixir package manager)
RUN mix local.hex --force

# Install rebar (Erlang build tool)
RUN mix local.rebar --force

# Copy all dependencies files
COPY mix.* ./

# Install all production dependencies
RUN mix deps.get --only prod

# Compile all dependencies
RUN mix deps.compile

# Copy all application files
COPY . .

EXPOSE 8080

# Compile the entire project
CMD ["mix","run","--no-halt" ]