class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.0/igris_0.2.0_darwin_arm64.tar.gz"
      sha256 "ff5786a1579644e82cac709a2d23ca1fa57bf094c258df01327e4905f6dcb65d"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.0/igris_0.2.0_darwin_amd64.tar.gz"
      sha256 "f891fb52206cf59795d86c8e977c74a655c2ecc97dca971e4b6caee71ee6d41d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.0/igris_0.2.0_linux_arm64.tar.gz"
      sha256 "329bbe6a7a642e1ea3a566ca1a71425d1d7f7d12742b75ef1e8871bebaf9bfee"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.0/igris_0.2.0_linux_amd64.tar.gz"
      sha256 "3a2b1686fa4785de78bd03cb436a2883b1042b695b5567232bc6ec915eab99e2"
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
