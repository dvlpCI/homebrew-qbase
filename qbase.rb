class Qbase < Formula
# Homebrew 要求：
# 文件名: qbase.rb （小写）
# 类名: Qbase （首字母大写，但第二个字母小写）
  desc "Qbase:脚本底层基础库"
  homepage "https://github.com/dvlpCI/script-qbase"

  version "0.9.38"
  url "https://github.com/dvlpCI/script-qbase/archive/#{version}.tar.gz"
  sha256 "1363c5e1e9f293824c47ac6dda90ece967ad6635883728ad7b1bcdc125fffc2f"

  depends_on "shc" => :build

  def install
    system "shc", "-r", "-f", "qbase.sh"
    mv "qbase.sh.x", "qbase"
    rm_f "qbase.sh.x.c"
    system "codesign", "--force", "--sign", "-", "qbase"
    bin.install "qbase"
    (prefix/"bin").install Dir["*"]
  end

  def uninstall
    rm "#{bin}/qbase"
  end

  test do
    system "#{bin}/qbase", "--version"
  end
end
