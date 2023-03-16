# elixir-study
Master Functional Programming techniques with Elixir and Phoenix while learning to build compelling web applications!

## Notes

### EGD - Erlang Graphical Drawer

`:egd` is no longer available in Elixir OTP, so to get around this

mix.exs:

```
{:egd, github: "erlang/egd"}
```

To install dependencies:

```
mix deps.clean --all
mix deps.get
mix deps.compile
```

### Generate docs

mix.exs:

```
{:ex_doc, "~> 0.18"}
```

```
mix docs
```