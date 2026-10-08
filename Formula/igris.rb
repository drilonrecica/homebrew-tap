class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.4.0/igris_0.4.0_darwin_arm64.tar.gz"
      sha256 "27fbc78c5061f54327e49eb0a20c53f148e56221c87a3defb119b9a981663a11"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.4.0/igris_0.4.0_darwin_amd64.tar.gz"
      sha256 "60b90292cbb3965df9f91e80b6798d8c3bf42f28b20fc8ed78297cfd0d0d03f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.4.0/igris_0.4.0_linux_arm64.tar.gz"
      sha256 "6ec07229716e49ac265e2e823418cc5740696fa3ea8a147404541394dd089ffa"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.4.0/igris_0.4.0_linux_amd64.tar.gz"
      sha256 "4c9e019e20dd5afd661b322ca92bcdab781c789baa940d1ad088f5a61052cb6d"
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
