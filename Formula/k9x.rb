class K9x < Formula
  desc "Event-driven Kubernetes TUI + agent CLI — ultra-fast, single binary"
  homepage "https://github.com/sudhikumar-work/k9x"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-arm64.tar.gz"
      sha256 "8ac0ed5282088e61c44bfd40da4dbdd2b2c599c94de498613e60cb822868beaf"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-amd64.tar.gz"
      sha256 "cccc133f6eb4384eb0235f367fc384a3d666203f057c2d1773fd50cb439c2be6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-arm64.tar.gz"
      sha256 "83b4174b663f97dc32b4b56196ff7c917a7876ad8e5f76f5a553148dc7fc1f0a"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-amd64.tar.gz"
      sha256 "b0292c18aa6cec149eabbc7ab3944f06851bfb8f54265d36c0c01a010ca95397"
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
