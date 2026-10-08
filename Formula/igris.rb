class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.1/igris_0.5.1_darwin_arm64.tar.gz"
      sha256 "407929798e68b9554d5e33b7d0099213e55ca6b967f24c8b771d56ae6a71225f"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.1/igris_0.5.1_darwin_amd64.tar.gz"
      sha256 "1e7f68e74c40c9b54efc122d3c1670fa964bd505c06d7ac5c0a72d36915ec956"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.1/igris_0.5.1_linux_arm64.tar.gz"
      sha256 "5a8d9ab553344784cc7da041930f4bb822be94fb272b371a6a11aa75309aaaf6"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.5.1/igris_0.5.1_linux_amd64.tar.gz"
      sha256 "d0cbe284cddecc15bff431907dd4d4986acec7d6820ebff8e542d78ad6cdedd8"
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
