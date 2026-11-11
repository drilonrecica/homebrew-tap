class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.0/igris_1.12.0_darwin_arm64.tar.gz"
      sha256 "b3e1b7ddd0cd5d51760ff240690181ebddc08bac34d15083b0a47adc07f30f5f"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.0/igris_1.12.0_darwin_amd64.tar.gz"
      sha256 "c3046e702bd01f1e852b05b29674d9cc03af79644aad3fc98d7edc426d2a947e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.0/igris_1.12.0_linux_arm64.tar.gz"
      sha256 "d07770dd0787fc1b03945ce660c2f00773b95024d2dc0629b1c90724f218316f"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.12.0/igris_1.12.0_linux_amd64.tar.gz"
      sha256 "b5611044c8a46a065948067812dd8d1a92bddb9ab93d982e9a77832ec5216783"
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
