class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.13.0/igris_1.13.0_darwin_arm64.tar.gz"
      sha256 "a4c9d1d91dfa5d89c1bc4a07cb4c515076a95cce5ac6d7c73d61102dc047a28a"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.13.0/igris_1.13.0_darwin_amd64.tar.gz"
      sha256 "d3f15f21cb33a223f2c40e05b6a1ed9bdee1ac4c78c618423115b889a1454982"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.13.0/igris_1.13.0_linux_arm64.tar.gz"
      sha256 "30dfbac33ed37d0f4acbfbfefcb4bd736052b4db207f550b009eaaac31a8343a"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.13.0/igris_1.13.0_linux_amd64.tar.gz"
      sha256 "745e7a7e443d7565fc829eb545c38155a4a3f93ff88ba63b6558a2856b4b981d"
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
