class Qbase < Formula
  desc "QBase:脚本底层基础库"
  homepage "https://github.com/dvlpCI/script-qbase"
  url "https://github.com/dvlpCI/script-qbase/archive/0.2.9.tar.gz"
  sha256 "3550803d20fd4c58606a501c2b813f65fdd60f5e74d88a55e2f99cfd280db53b"
  # shasum -a 256 xxxx.tar.gz
  # version /(\d+\.\d+\.\d+)/  # 从 URL 中提取版本号

  def install
    # Install script to bin
    # bin.install "helloworld.sh"
    bin.install "qbase" # 将 QBase 软件包解压缩，并将 qbase 可执行文件安装到 /usr/local/bin 目录中。
    (prefix/"bin").install Dir["*"] #  不在[/usr/local/lib] 、 在[/usr/local/Cellar/qbase/0.0.3/bin]
  end


  def uninstall
    # rm "#{bin}/helloworld.sh"
    rm "#{bin}/qbase"
  end

  test do
    # Test your script
    system "#{bin}/qbase", "--version"
  end
end
