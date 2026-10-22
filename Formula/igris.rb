class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.5.0/igris_1.5.0_darwin_arm64.tar.gz"
      sha256 "d5894b1813a5b07bdc93c1eeac84320dcb97eeec4e51affab64296b8a64cd1f0"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.5.0/igris_1.5.0_darwin_amd64.tar.gz"
      sha256 "0b1a661d256d17cc4c34c2cfbaaa1945af58ee0af2d221655bd62a038f5c8f83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.5.0/igris_1.5.0_linux_arm64.tar.gz"
      sha256 "d4148ce48b08619d5b7bea4af3cbded10395315afdb09e51f5a0a33be9094846"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.5.0/igris_1.5.0_linux_amd64.tar.gz"
      sha256 "2b7e8250713bd8217a73021d8646123a5caa866c45dd31ef01142e31d359fe6d"
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
