class K9x < Formula
  desc "Event-driven Kubernetes TUI + agent CLI — ultra-fast, single binary"
  homepage "https://github.com/sudhikumar-work/k9x"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-arm64.tar.gz"
      sha256 "4dee7a2690a38db975a2523c867859775feec4f807d99ca6e33b449fa24dc98e"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-amd64.tar.gz"
      sha256 "d0f32782453f114f6799ce2eb7cbcaa6a608683b3aacc96b3f3cef75aab05a5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-arm64.tar.gz"
      sha256 "3c1204193a5e278371e522d37675d5e8d8b066785553845731578d1cef076dfb"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-amd64.tar.gz"
      sha256 "f056507e6cb9b9ab886bd754d84ef64f4f0f48bb414a896b66615e49a03d427c"
    end
  end

  def install
    bin.install "k9x"
    # Install shell completions if present
    if File.exist?("contrib/completions/k9x.bash")
      bash_completion.install "contrib/completions/k9x.bash" => "k9x"
    end
    if File.exist?("contrib/completions/k9x.zsh")
      zsh_completion.install "contrib/completions/k9x.zsh" => "_k9x"
    end
    if File.exist?("contrib/completions/k9x.fish")
      fish_completion.install "contrib/completions/k9x.fish"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/k9x --version")
  end
end
