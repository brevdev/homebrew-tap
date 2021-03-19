class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download" 
  version "0.1.2"

  bottle do
    root_url "https://github.com/brevdev/brev-go-cli/releases/latest/download"
    sha256 arm64_big_sur: "d6b665b744bcbb00160357f504a3b71a34c61e7179aef38c8b376cfdf6a29cd8"
    sha256 big_sur:       "a2c72332fb40ee306f3538ff09b943358a529b5bafe07b7118d59128bb39280c"
    sha256 catalina:      "37e99897a6a58214e9bf29d9c8ded3655628f7c530485ddd5e68cdb1dd21eccf"
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

