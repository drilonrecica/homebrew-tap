class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.6.0/igris_1.6.0_darwin_arm64.tar.gz"
      sha256 "4d79e34e69b7c9872367c3b45f5d5e231767ab11ed2bff790b7821d79e28c684"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.6.0/igris_1.6.0_darwin_amd64.tar.gz"
      sha256 "e5f6100c8aed9700022c453d4653c48002d5c2c782adc4337f6c40a998e48e27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.6.0/igris_1.6.0_linux_arm64.tar.gz"
      sha256 "a095e6017ec1473705757f5f2752476f9691b710dec9f957e17338512f143830"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.6.0/igris_1.6.0_linux_amd64.tar.gz"
      sha256 "898c32f91f8107f695b288ae08e2c0a8ac9a4eeb89cc94afb273bc99ca9abd37"
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
