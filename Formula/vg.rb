class Vg < Formula
  desc "Vector Grep - fully local semantic search CLI for code"
  homepage "https://github.com/assimelha/vg"
  version "0.0.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/vg/releases/download/v0.0.1/vg"
    sha256 "de72b4023a633ea289e06a976548be16de4f1e566b90e4dcc6d28d587ba70115"
  else
    # Intel build not yet available
    odie "vg is currently only available for Apple Silicon (arm64)"
  end

  def install
    bin.install "vg"
  end

  test do
    assert_match "vg", shell_output("#{bin}/vg --help")
  end
end
