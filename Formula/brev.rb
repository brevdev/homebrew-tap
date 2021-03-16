class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-osx-64.tar.gz"
  sha256 "abb8525782a0baa5fb416cbb84ca998b23cbcc6c25e8bb323045a717a194dff6"
  version "0.1.0"

  def install
    bin.install "brev"
  end
end

