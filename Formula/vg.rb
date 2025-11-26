class Vg < Formula
  desc "Vector Grep - fully local semantic search CLI for code"
  homepage "https://github.com/assimelha/vg"
  version "0.0.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/vg/releases/download/v0.0.1/vg"
    sha256 "5e51592283e96707ce0518f6e45fef7e05a17c1221ec74aabaaf3874efa0c08c"
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
