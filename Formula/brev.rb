class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli.git",
    tag: "0.1.2"

#  option "without-completions", "Disable shell completion installation"

  bottle do
    root_url "https://github.com/brevdev/brev-go-cli/releases/latest/download"
    sha256 cellar: :any, arm64_big_sur: "e91d819895e76b3c1929ddf90337d1d3f1306ff21fd2def1eeedc1a0b185f358"
    sha256 cellar: :any, big_sur:       "9e19597dd75dfd9735781a1d9a32bcc34c8d86bd15b783ed5fa8661c5531c7ff"
    sha256 cellar: :any, catalina:      "cdf27c0f151ac6eea3fb7fe183fe005dd86273fa7cb39112bb35facce064e75a"
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

