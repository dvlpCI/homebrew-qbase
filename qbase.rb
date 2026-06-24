class Qbase < Formula
# Homebrew 要求：
# 文件名: qbase.rb （小写）
# 类名: Qbase （首字母大写，但第二个字母小写）
  desc "Qbase:脚本底层基础库"
  homepage "https://github.com/dvlpCI/script-qbase"

version "0.9.46"
url "https://github.com/dvlpCI/script-qbase/archive/#{version}.tar.gz"
sha256 "0cf06c043b22e4433c8023d2b3740c6b88a74f7bb53c1a4c8b5d492bf9a3d65b"

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
