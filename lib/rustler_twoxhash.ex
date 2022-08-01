defmodule RustlerTwoxhash do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :rustler_twoxhash,
    crate: "twoxhash",
    base_url: "https://github.com/Astrocoders/rustler_twoxhash/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION") in ["1", "true"],
    version: version

  # When your NIF is loaded, it will override this function.
  def hash32(_), do: :erlang.nif_error(:nif_not_loaded)
end
