class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.8.0/igris_1.8.0_darwin_arm64.tar.gz"
      sha256 "44337106c7b262c1632b889f38f37a166897fe030f674eaa528b1a8a5f42010f"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.8.0/igris_1.8.0_darwin_amd64.tar.gz"
      sha256 "495033d7f056d2b1be430e74d9fd16f0f75e02058ff8123f37c5a3a3de9a0ecd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.8.0/igris_1.8.0_linux_arm64.tar.gz"
      sha256 "15b80ba469a2aa8527ce5c3a24496be27a51c0ed35a6d53b5601af234eae6de9"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.8.0/igris_1.8.0_linux_amd64.tar.gz"
      sha256 "a89d55c1080d90e9aca4b9d63a5ed04d31512da7bdd22801fc2d3064725aefeb"
    end
  end

  def install
    bin.install "igris"
    generate_completions_from_executable(bin/"igris", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/igris version")
  end
end
