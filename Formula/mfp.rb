class Mfp < Formula
  desc "Terminal UI for musicforprogramming.net — streams all MFP episodes in your terminal"
  homepage "https://github.com/fpigeonjr/music-for-coding-tui"
  url "https://github.com/fpigeonjr/music-for-coding-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "794120b5a722f40ec5aec78ef63b0a2fe413fc82799abf5df6993683ab4c6871"
  license "MIT"
  head "https://github.com/fpigeonjr/music-for-coding-tui.git", branch: "main"

  depends_on "go" => :build
  depends_on "mpv"

  def install
    system "go", "build",
      "-ldflags", "-X main.version=#{version}",
      "-o", bin/"mfp",
      "./cmd/mfp"
  end

  test do
    assert_match "mfp v#{version}", shell_output("#{bin}/mfp --version")
  end
end
