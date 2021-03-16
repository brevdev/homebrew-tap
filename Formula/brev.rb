class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-osx-64.tar.gz"
  sha256 "a6df4baa64012b22425adb8134b0a0e09905636351a0a1a981a62494d63812a6"
  version "0.1.0"

  def install
    bin.install "brev"
  end
end

