class Bdui < Formula
  desc "Real-time Text User Interface for bd (beads) issue tracker"
  homepage "https://github.com/assimelha/bdui"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/assimelha/bdui/releases/download/v0.2.0/bdui-macos-arm64"
    sha256 "e7ca1cdefab6cbc8e6947c418d5a022a484d043ff6b7f3128d46305dcb480ce2"
  else
    url "https://github.com/assimelha/bdui/releases/download/v0.2.0/bdui-macos-x64"
    sha256 "c407a26c335240d3d09edaea1a3419e09d660bac85afbde027b60ee3bbbb1d78"
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
