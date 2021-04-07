class Brev < Formula
  desc "Brev CLI"
  homepage "https://brev.dev"
  url "https://github.com/brevdev/brev-go-cli/releases/latest/download/brev-homebrew-bundle.tar.gz"
  sha256 "264f99615a1407eddb586e90c226e6ec425a009d79e594f1994ed8d4c6187562"
  version "0.1.4"

  def install
    if MacOS.version == :arm64_big_sur
      ohai "Installing arm64_big_sur"
      bin.install "brev-arm64_big_sur" => "brev"
    elsif MacOS.version == :big_sur
      ohai "Installing big_sur"
      bin.install "brev-big_sur" => "brev"
    elsif MacOS.version == :catalina
      ohai "Installing catalina"
      bin.install "brev-catalina" => "brev"
    else
      odie "Incompatible MacOS version"
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

