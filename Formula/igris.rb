class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.9.0/igris_1.9.0_darwin_arm64.tar.gz"
      sha256 "987df0eb37cafd8629ca891bc8b977715931626130035d81d65bdf26ad5834f1"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.9.0/igris_1.9.0_darwin_amd64.tar.gz"
      sha256 "39b5738f1db0cffa7bacbaa21e7101142b553ebf2b91e06ae516a263f88e2763"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.9.0/igris_1.9.0_linux_arm64.tar.gz"
      sha256 "ef2cccf1dd80ca127c1c17fca42c0d1740eed058870ab9158d97fbcf3087165b"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.9.0/igris_1.9.0_linux_amd64.tar.gz"
      sha256 "2b9e920699cb1e6e112e020845517f91aabcf20589c6b2d9198494ff40ad4f93"
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
