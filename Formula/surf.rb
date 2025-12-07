class Surf < Formula
  desc "Web browser for LLMs - converts pages to markdown with JS execution"
  homepage "https://github.com/assimelha/surf"
  version "1.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/surf/releases/download/v1.2.0/surf-darwin-arm64"
    sha256 "6733f2116f2be76a0396bca7f1b14b45fb5c4b5a233b3bfa2193cd74e55df2e2"
  else
    url "https://github.com/assimelha/surf/releases/download/v1.2.0/surf-darwin-amd64"
    sha256 "b7255e53f862cb9603a828a75b9ba455d88af5aafaf6ac22dc28f6c329b3d95e"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "surf-darwin-arm64" => "surf"
    else
      bin.install "surf-darwin-amd64" => "surf"
    end
  end

  test do
    assert_match "surf", shell_output("#{bin}/surf --help")
  end
end
