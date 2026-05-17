class Qbase < Formula
# Homebrew 要求：
# 文件名: qbase.rb （小写）
# 类名: Qbase （首字母大写，但第二个字母小写）
  desc "Qbase:脚本底层基础库"
  homepage "https://github.com/dvlpCI/script-qbase"

version "0.9.40"
url "https://github.com/dvlpCI/script-qbase/archive/#{version}.tar.gz"
sha256 "2713f6a48269817b3ed5cb49660dbd8e184d398656174edb1d03d65c3e98a951"

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
