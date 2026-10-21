class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.0/igris_1.2.0_darwin_arm64.tar.gz"
      sha256 "87ec6ac57b6da463060d921fc0d3611b4d86d9ac4c29c33abcde1908ac6f1aab"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.0/igris_1.2.0_darwin_amd64.tar.gz"
      sha256 "2bb01227875e51d9c5280c12954a7fc1c14558dc98c938960ff6c079f47dc3b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.0/igris_1.2.0_linux_arm64.tar.gz"
      sha256 "71cc9ae194f2cc75abf51c18d838175be26281ba530471620a0428de6eebf179"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.2.0/igris_1.2.0_linux_amd64.tar.gz"
      sha256 "a5f0d1b04ed09198c1fab865317015358b42f359bef28ed016b04d68c8e8b6ab"
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
