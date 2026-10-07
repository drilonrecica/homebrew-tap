class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.3.0/igris_0.3.0_darwin_arm64.tar.gz"
      sha256 "a322f1e573867db08147094bcdb1bffdbf53176858126bbdec07ffabf4c9bf0f"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.3.0/igris_0.3.0_darwin_amd64.tar.gz"
      sha256 "4c6f5834777b4e7f3edc66ca26425121401e54c2caf407e47d28f4d59aea18b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.3.0/igris_0.3.0_linux_arm64.tar.gz"
      sha256 "69ba1a680440fd482e6b4a8e9cb4063b7aeb1b33388915a6cdcd18063d8b47fc"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.3.0/igris_0.3.0_linux_amd64.tar.gz"
      sha256 "e8ec8244a401337216a384b3b1a876b53dc2c5a64049e2936c0bb6f6e36438b7"
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
