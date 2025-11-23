class Bdui < Formula
  desc "Real-time Text User Interface for bd (beads) issue tracker"
  homepage "https://github.com/assimelha/bdui"
  version "0.1.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/bdui/releases/download/v0.1.1/bdui-macos-arm64"
    sha256 "1c238055b246f739f2b4d1a9c25463192afc96f3ce281ff0e8cff1c3b3dc8310"
  else
    url "https://github.com/assimelha/bdui/releases/download/v0.1.1/bdui-macos-x64"
    sha256 "8a54c53876b5d0e8d3f2077c7adcaecc4e408ece34f3c2394e38c2e9eb59fc67"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "bdui-macos-arm64" => "bdui"
    else
      bin.install "bdui-macos-x64" => "bdui"
    end
  end

  test do
    assert_match "bdui", shell_output("#{bin}/bdui --help 2>&1", 1)
  end
end
