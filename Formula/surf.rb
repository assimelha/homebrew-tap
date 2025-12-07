class Surf < Formula
  desc "Web browser for LLMs - converts pages to markdown with JS execution"
  homepage "https://github.com/assimelha/surf"
  version "1.3.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/surf/releases/download/v1.3.0/surf-darwin-arm64"
    sha256 "318ffeb769550b90b6e7eb7ab0e96975f4d4d872252a2ca4f5e45ca36431803f"
  else
    url "https://github.com/assimelha/surf/releases/download/v1.3.0/surf-darwin-amd64"
    sha256 "ce00b7e7181938b9764de4f9ce4a22112461dc9157208cd0310f0d4932b5bf8f"
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
