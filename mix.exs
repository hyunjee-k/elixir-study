defmodule Cards.MixProject do
  use Mix.Project

  def project do
    [
      app: :cards,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.18"}
    ]
  end
end

"""
  [패키지 설정]
    - mix.exs 파일의 deps에 패키지를 추가한다.
    - ex) ex_doc을 사용해 문서화를 편리하게 할 수 있다.
      - deps: [{:ex_doc, "~> 0.18", only: :dev, runtime: false}]
      - mix.exs 파일이 있는 폴더에서 mix deps.get을 실행한다.
      - mix docs를 실행하면 문서화가 된다.
      - 문서화된 파일은 doc/index.html에서 확인할 수 있다.
"""
