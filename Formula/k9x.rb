class K9x < Formula
  desc "Event-driven Kubernetes TUI + agent CLI — ultra-fast, single binary"
  homepage "https://github.com/sudhikumar-work/k9x"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-arm64.tar.gz"
      sha256 "2609a8f89215e554089024b069eab3c92d3357498054fa218c9c7e7fffe40717"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-darwin-amd64.tar.gz"
      sha256 "22b9d501123166f56e3ca339c27853c68c0c3c56b20114182d3e0b383921c0a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-arm64.tar.gz"
      sha256 "0494c7328338d9dedc315e691407f835555911efeae6b9d84d2483dfe5aeb0a4"
    else
      url "https://github.com/sudhikumar-work/k9x/releases/download/v#{version}/k9x-#{version}-linux-amd64.tar.gz"
      sha256 "5050e4ed45614b84bea9e3e1f7f6ba49026e10a4336055d0355a014ee000542e"
    end
  end

  def install
    bin.install "k9x"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/k9x --version")
  end
end
