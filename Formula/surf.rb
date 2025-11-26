class Surf < Formula
  desc "Web browser for LLMs - converts pages to markdown with JS execution"
  homepage "https://github.com/assimelha/surf"
  version "1.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/surf/releases/download/v1.1.0/surf-darwin-arm64"
    sha256 "5550945453261e12d4263849b7540e7e106ca6c495fb83311ed9a9ea327798d5"
  else
    url "https://github.com/assimelha/surf/releases/download/v1.1.0/surf-darwin-amd64"
    sha256 "974291408061d7d1993bade07d371badc119648bb036fe0379d45c60f062d4cc"
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
