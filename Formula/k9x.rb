class K9x < Formula
  desc "Event-driven Kubernetes TUI + agent CLI — ultra-fast, single binary"
  homepage "https://github.com/sudhikumar-work/k9x"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-arm64.tar.gz"
      sha256 "e9d11674704c28626c5671dd09f9381b8d1899c49379f49b7cd2359b2dda43d8"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-amd64.tar.gz"
      sha256 "9e94753c35200766bf42322f88ac0d2d7bd31edeeee211f2ca284d1755765cde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-arm64.tar.gz"
      sha256 "eeeaa1548d015cab7101e9d7137752fd243fb1805b2d7c0d9b6612d3f5885923"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-amd64.tar.gz"
      sha256 "870ea1066046f92428fc1bc1e466c0fa1723fd7cf5d829616b8583e723ca3ded"
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
