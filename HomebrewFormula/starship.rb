class Starship < Formula
  desc "The cross-shell prompt for astronauts (jason0x43's fork)"
  homepage "https://starship.rs"
  url "https://github.com/jason0x43/starship/archive/v0.18.0.tar.gz"
  head "https://github.com/jason0x43/starship.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    ENV["STARSHIP_CONFIG"] = ""
    assert_equal "[1;32m❯[0m ", shell_output("#{bin}/starship module character")
  end
end
