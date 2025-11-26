class Surf < Formula
  desc "Web browser for LLMs - converts pages to markdown with JS execution"
  homepage "https://github.com/assimelha/surf"
  version "1.0.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/surf/releases/download/v1.0.0/surf-darwin-arm64"
    sha256 "472d57d850f109c26ba3abf0bbab03cfee68c0abb31ebf3a8616afbbc87214b1"
  else
    url "https://github.com/assimelha/surf/releases/download/v1.0.0/surf-darwin-amd64"
    sha256 "5723cf685ff6e5e6b4b0fc6cc059f8972a321f7168964cc816f2025beffd2108"
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
