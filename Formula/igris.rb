class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.4.0/igris_1.4.0_darwin_arm64.tar.gz"
      sha256 "654df24fc315e95ab42ff0c8ea53cb3602c9d463d75df9b143623245e73e9cc3"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.4.0/igris_1.4.0_darwin_amd64.tar.gz"
      sha256 "162cbf4e456a39c83246116b31b41cc5a4c20734e84b64615762bf84a5c27e71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.4.0/igris_1.4.0_linux_arm64.tar.gz"
      sha256 "184089d2e2522e00e2d94188bb4c621963186f19780d282ee4ae1674072f9c66"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.4.0/igris_1.4.0_linux_amd64.tar.gz"
      sha256 "81ed4e05cf6a10223b864f2d8dde19286a8031e2a7fa674238771858324c80b0"
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
