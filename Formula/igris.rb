class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.1/igris_1.2.1_darwin_arm64.tar.gz"
      sha256 "08664b1c187a0864c30f145e6a1287360e875ce43f6a8df7aa1ef8a4f1a65327"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.1/igris_1.2.1_darwin_amd64.tar.gz"
      sha256 "56d43df6ecdd0098f8b225ae0cd80fb225287be2befd144bfc2dd71947bb27fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.1/igris_1.2.1_linux_arm64.tar.gz"
      sha256 "d684d32553d1eacbe1848062442e816d56b98a613bce745ac18083c103f9d375"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.1/igris_1.2.1_linux_amd64.tar.gz"
      sha256 "36b722137f28c3c2ebef4ef59718cd39b320cf2a632d0ff402c0fcff95ee5747"
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
