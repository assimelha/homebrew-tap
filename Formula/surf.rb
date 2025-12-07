class Surf < Formula
  desc "Web browser for LLMs - converts pages to markdown with JS execution"
  homepage "https://github.com/assimelha/surf"
  version "1.4.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/surf/releases/download/v1.4.0/surf-darwin-arm64"
    sha256 "a5d4ec126937183efa8cfe12028e9509c6628fb8414e0aa8fb825477b12f8396"
  else
    url "https://github.com/assimelha/surf/releases/download/v1.4.0/surf-darwin-amd64"
    sha256 "93c851841d462e7ebdc8036feecd599817479e4b34c7862bb6e515ab2be842a6"
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
