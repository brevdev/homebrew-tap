class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download" 
  version "0.1.2"

  bottle do
    root_url "https://github.com/brevdev/brev-go-cli/releases/latest/download"
    sha256 catalina:      "4663889fd04787a67c1e644ed4ab649011a9f3007901851375ec72eefac00aec"
    sha256 big_sur:       "58f25d69a79eeb0854198db3a24e872ea9a234c2fc929773303002cea4db277b"
    sha256 arm64_big_sur: "b8e921ddb9b257cf55f1411ce12eef6794ef11f39560719126d96d3f3e64ed4c"
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

