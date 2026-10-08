class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.0/igris_0.5.0_darwin_arm64.tar.gz"
      sha256 "2340ee52a55e3aa82ffb18457a223dcf1fca41c9eb6cb23ad837015df6df65dd"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.0/igris_0.5.0_darwin_amd64.tar.gz"
      sha256 "b329a08c8d10735f4b08ff09ec34481ff8e1d3e239f6c9fb7f9a4196a18f0d07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.0/igris_0.5.0_linux_arm64.tar.gz"
      sha256 "5bb20c4011b371c41f61df590c1a23b8d8af3424a0b6e3379f227867d01a3351"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.0/igris_0.5.0_linux_amd64.tar.gz"
      sha256 "eafcdfb83676383f2151ca2f577e41d89d8f729b9064fe1362b6003a8ca09fbc"
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
