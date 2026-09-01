class K9x < Formula
  desc "Event-driven Kubernetes TUI + agent CLI — ultra-fast, single binary"
  homepage "https://github.com/sudhikumar-work/k9x"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-arm64.tar.gz"
      sha256 "bac6ad8b37d8187f6df32e3f1c5910f18e863d0a1d373382c2e2a36397aa1ff3"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-amd64.tar.gz"
      sha256 "f4d76aaad8551a89e4968b1597593030312c742228ae892e399d6310a87bab38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-arm64.tar.gz"
      sha256 "51a20375152160577e205fdd92709d012387e17dc81c77182fa88bceabddefda"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-amd64.tar.gz"
      sha256 "62cd007783c68469004b3190f465a08edea9f95bf5af2509a75152b1af65117c"
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
