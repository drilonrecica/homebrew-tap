class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.0.0/igris_1.0.0_darwin_arm64.tar.gz"
      sha256 "4e9b757ac4270ec43f86fe09035f09b79b6c83872452128280e890f7f42c125e"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.0.0/igris_1.0.0_darwin_amd64.tar.gz"
      sha256 "fd29c8af1c5f1634ef746e4a4929ea4aaca69b853c53e89424b6a6f67fb90cd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.0.0/igris_1.0.0_linux_arm64.tar.gz"
      sha256 "d92265dbc0b64d2f1eb79dd022d542d8110d784066afb72961943d94a4310af4"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.0.0/igris_1.0.0_linux_amd64.tar.gz"
      sha256 "3262dea6dd02af9e403e7be56b0a9dad435429f9ef353993cb7b2742d97cf06e"
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
