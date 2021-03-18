class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-osx-64.tar.gz"
  sha256 "d0411965c431d965b310e1b098c80db581b640585f4f66506bc3e8e1dba6fc20"
  version "0.1.2"

  def install
    bin.install "brev"
    #(buildpath/"brev").write system "#{bin}/brev", "completion", "bash"
    (buildpath/"_brev").write system "#{bin}/brev", "completion", "zsh"
    #bash_completion.install "bash"
    zsh_completion.install "_brev"
  end

  test do
    system "#{bin}/brev version"
  end
end

