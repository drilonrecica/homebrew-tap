class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.11.0/igris_1.11.0_darwin_arm64.tar.gz"
      sha256 "367c95b3716d1a719b5c365604762ae3199c00447bd2ac93c7b544c7d31eaaaf"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.11.0/igris_1.11.0_darwin_amd64.tar.gz"
      sha256 "0dcb274c2aa64156601832481303c66aee8463e798988716ba8a9fbff755618f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.11.0/igris_1.11.0_linux_arm64.tar.gz"
      sha256 "a57012c4fe3be942784020eb8ee8c03da4d877fb916833cf45f4c001a88eb0c8"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.11.0/igris_1.11.0_linux_amd64.tar.gz"
      sha256 "cb65fe976e365f61b5b45cc3e0bceda5275ceb1496f0d2a1b4a00858cae163ac"
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
