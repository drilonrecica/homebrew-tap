class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.1/igris_0.2.1_darwin_arm64.tar.gz"
      sha256 "988b373909d33338c502b5c791060e1667958234878e92bc97ee1db3182c455c"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.1/igris_0.2.1_darwin_amd64.tar.gz"
      sha256 "ee9f97f7722e5a746b0cde95f1bf861bb3778a3044e6d3252cc38e7431a9e6a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.1/igris_0.2.1_linux_arm64.tar.gz"
      sha256 "d41c24ca210f28a136c4862c25f6a06413de65aec27a85fa684e053167068483"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.2.1/igris_0.2.1_linux_amd64.tar.gz"
      sha256 "2a0632dc1101e8e354b60f7d70cab6d218e4c4cdb92cd401681d01a32bb64846"
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
