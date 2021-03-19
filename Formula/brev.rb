class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download" 
  version "0.1.2"

  bottle do
    root_url "https://github.com/brevdev/brev-go-cli/releases/latest/download"
    sha256 catalina:      "6208bfffde7bb50e67a3e899ce776129ec7bf7ae67c4d7c1281682070ce403ba"
    sha256 big_sur:       "4ec3d9b8568ea1a911e81836bd9862a932e20dd2da3a08e78316ee1aa53caed9"
    sha256 arm64_big_sur: "e88d80fe7543d07cd0bbda3563d3b89678807503ff69af05e1473629353aff45"
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

