class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.1/igris_1.12.1_darwin_arm64.tar.gz"
      sha256 "5069e6d44f3ae02145e537ac3164a4826263a6c5c30c1ca57233003877c63e7b"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.1/igris_1.12.1_darwin_amd64.tar.gz"
      sha256 "0d60c3a6a900ccaef668b9aa417a0ff976b0e4bdf2448316fc3e97fd4ce1b342"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.1/igris_1.12.1_linux_arm64.tar.gz"
      sha256 "200cafd0a2c7e7255eb9ea048d610a0a2adfe110cee0eee2a1d414338dec6edd"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.1/igris_1.12.1_linux_amd64.tar.gz"
      sha256 "d440e56cd0f61a8b0bea3fa6a5246665f357d4e6dd9c6f1d83d45002a8046190"
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
