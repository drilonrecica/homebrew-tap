class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.1.0/igris_1.1.0_darwin_arm64.tar.gz"
      sha256 "86d52665fb5d10364554cc14c761d7b2e5383e871b76299b81299117e8f2c4e7"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.1.0/igris_1.1.0_darwin_amd64.tar.gz"
      sha256 "ae482697360bc2c502f40d6ea8d79dea39fdc8200248045f20c2a1cd6c133562"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.1.0/igris_1.1.0_linux_arm64.tar.gz"
      sha256 "bb9ee71171f95bfb2d7637268bd0866f59270dc8dd6e9f23a097d00de739a6fd"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.1.0/igris_1.1.0_linux_amd64.tar.gz"
      sha256 "f19f25ec52730b1610a0d158025ba0372d46dee3b4efe65f789994c618ff025d"
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
