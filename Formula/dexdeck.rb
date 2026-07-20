class Dexdeck < Formula
  desc "Fast, private terminal control plane for Android development"
  homepage "https://github.com/drilonrecica/dexdeck"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.1/dexdeck-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "ef2706113e90896b13b8434685dddc22f3b2c3e8ea839a77bd9c83f85cd51154"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.1/dexdeck-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "4d859d5fd7c602c9a229d8bfdbe84122a017c8f70a0505cdfd3100232a2fb745"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.1/dexdeck-0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7f32e65296a4fee3b46a144548714474ed15a1ce814fe66f9e4751285973072"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.1/dexdeck-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c63a9075086c59667ed261ae5ec57afceec1a72e735f8a29bb8a15c831649bbb"
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
