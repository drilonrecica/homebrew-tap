class Dexdeck < Formula
  desc "Fast, private terminal control plane for Android development"
  homepage "https://github.com/drilonrecica/dexdeck"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.2/dexdeck-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "7797b971dc01806e8d7528d3ad81d957858fa00137391eb8421ce6e2b47dc3e1"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.2/dexdeck-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "24e869b9cc09bd5dfde2e1a5e42d7d7228cec07d1d54f01381f8943320733f39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.2/dexdeck-0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be13e7b1e3a4a375bd41a1a8a82f3b2563ab8ec70d0671f67cc4d09b54213af2"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.2/dexdeck-0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40dbb4dd8526451952fd2c1349afc596659bf1d2a52631037617f2a437c95b0b"
    end
  end

  def install
    bin.install "dexdeck"
    man1.install "man/man1/dexdeck.1"
    bash_completion.install "completions/dexdeck.bash" => "dexdeck"
    zsh_completion.install "completions/_dexdeck"
    fish_completion.install "completions/dexdeck.fish"
  end

  test do
    assert_match "DexDeck #{version}", shell_output("#{bin}/dexdeck version")
  end
end
