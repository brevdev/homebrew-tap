class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-osx-64.tar.gz"
  sha256 "5df4af103289f259c839ec09fb969035fd0e8e40362097caf6aad45b8b1293fd"
  version "0.1.1"

  def install
    bin.install "brev"
  end
end

