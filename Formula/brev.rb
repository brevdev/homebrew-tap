class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download" 
  version "0.1.2"

  bottle do
    root_url "https://github.com/brevdev/brev-go-cli/releases/latest/download"
    sha256 catalina:      "a17f2ca9870c0b5eb9b8b64f67f48b5578315272d7ee421884a7b17de76adb3b"
    sha256 big_sur:       "2ff502821e8917e8e893b5f0c88cc7edf584cfcff2a7d5ffba1f362d1b11e6f1"
    sha256 arm64_big_sur: "c9546911fca4f402a5d25a9f585429296e7f38f9ff3157aaca755ddc4e95d12f"
  end

  def install
    bin.install "brev"

    FileUtils.mkdir_p "completions/zsh"
    FileUtils.mkdir_p "completions/bash"

    system "bash", "-c", "#{bin}/brev completion zsh > completions/zsh/_brev"
    system "bash", "-c", "#{bin}/brev completion bash > completions/bash/brev"

    zsh_completion.install "completions/zsh/_brev"
    bash_completion.install "completions/bash/brev"
  end

  test do
    system "#{bin}/brev version"
  end
end

