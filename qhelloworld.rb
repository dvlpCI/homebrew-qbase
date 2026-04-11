class Qhelloworld < Formula
# Homebrew 要求：
# 文件名: qhelloworld.rb （小写）
# 类名: Qhelloworld （首字母大写，但第二个字母小写）
  desc "Qhelloworld: 尝试创建 homebrew tap 的样例"
  homepage "https://github.com/dvlpCI/script-qbase"
  url "https://github.com/dvlpCI/script-qbase/archive/qhelloworld-0.0.1.tar.gz"
  sha256 "414f995ecd28a4cbdeac0f4954d20d1b77c7b868101cfe8b1959218a15c41f8b"

  def install
    # Install script to bin
    # bin.install "qhelloworld.sh"
    bin.install "qhelloworld"
  end

  # def install2
  #   # 将软件包安装到 /usr/local/Cellar 目录中
  #   prefix.install Dir["*"]
  # end

  def uninstall
    # rm "#{bin}/qhelloworld.sh"
    rm "#{bin}/qhelloworld"
  end

  test do
    # Test your script
    system "#{bin}/qhelloworld", "--version"
  end
end