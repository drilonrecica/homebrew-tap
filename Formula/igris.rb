class Igris < Formula
  desc "Runs a project's task plan through Claude Code sessions in herdr, one task at a time"
  homepage "https://drilonrecica.github.io/igris/"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.7.0/igris_1.7.0_darwin_arm64.tar.gz"
      sha256 "8bb60bb6899bb7e4b7bca8b1a702c4e27be62def6f48b810a4dbc9364bc41fad"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.7.0/igris_1.7.0_darwin_amd64.tar.gz"
      sha256 "4613aed2e98bbec69219e0849fc424335af56fd78a23bfdea7a5d292efd41c4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/igris/releases/download/v1.7.0/igris_1.7.0_linux_arm64.tar.gz"
      sha256 "48df053d5c0d565d48dbaa36d79e89781883a958206f227b8edae426ab6baabe"
    else
      url "https://github.com/drilonrecica/igris/releases/download/v1.7.0/igris_1.7.0_linux_amd64.tar.gz"
      sha256 "911269df0251ade4e7fe09c3e31943467c558bb4847f718bc446533e0878551e"
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
