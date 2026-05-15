class Qbase < Formula
# Homebrew 要求：
# 文件名: qbase.rb （小写）
# 类名: Qbase （首字母大写，但第二个字母小写）
  desc "Qbase:脚本底层基础库"
  homepage "https://github.com/dvlpCI/script-qbase"

  version "0.9.36"
  url "https://github.com/dvlpCI/script-qbase/archive/#{version}.tar.gz"
  sha256 "1b2b5ebb641fed0a2ce678fb1fe4dabf789d0fca86ca6a2ee33d126c6bc3f8eb"

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
