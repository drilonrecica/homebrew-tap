class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.6.0/igris_0.6.0_darwin_arm64.tar.gz"
      sha256 "ea43611f990f347462e5537e075e97871d4336310a00b9729e2db4b311e5e8f4"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.6.0/igris_0.6.0_darwin_amd64.tar.gz"
      sha256 "a40daeccb5de724acc34c04a4d87b0d52fffdc7ee19d08a3e6b021635c506689"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v0.6.0/igris_0.6.0_linux_arm64.tar.gz"
      sha256 "1fd51dab99c3eb2a4dff55adc015f10ef4ac25fbb268ce0501a2b411d1eba3bb"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v0.6.0/igris_0.6.0_linux_amd64.tar.gz"
      sha256 "9711c547ce11c500e5d4f792742015c11f0642893ce5b5d7a9fd3934a9c4ede6"
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
