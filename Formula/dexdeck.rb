class Dexdeck < Formula
  desc "Fast, private terminal control plane for Android development"
  homepage "https://github.com/drilonrecica/dexdeck"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.0/dexdeck-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "654fbdfc28ba006e80587f3ce5106dd935b8beaf68628dba516ec9736b69e4a5"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.0/dexdeck-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e186b16be56cd193d4303a65ba308d285791578ec73ecc43d9e06a7ec35c23f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.0/dexdeck-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7526023d6433d1cda7bb15e4a6b862fcb99f5ca5578e695bc8c3941b8c66c6ef"
    else
      url "https://github.com/drilonrecica/dexdeck/releases/download/v0.2.0/dexdeck-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d057a6cce6d4df9581f71aef7cb3c8ee86ae23a7c9d0418f4a5dc44257a52229"
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
