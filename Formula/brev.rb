class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-homebrew-bundle.tar.gz"
  sha256 "a1b7ab7b05953f1d0cd601c22f75c7ac161ecfa0aa10f3ee1ac862dbec48c5df"
  version "0.1.2"

  def install
    if :macos == :arm64_big_sur
      bin.install "brev-arm64_big_sur" => "brev"
    end
    if :macos == :big_sur
      bin.install "brev-big_sur" => "brev"
    end
    if :macos == :catalina
      bin.install "brev-catalina" => "brev"
    end

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

