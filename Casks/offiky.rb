cask "offiky" do
  version "1.0.0"
  sha256 "56a13c1e9a9a9c069c72b2c6c0492a81b92d2184f1dd3f036fa13cb0bfa892c8"

  url "https://github.com/supungbab/offiky/releases/download/v#{version}/offiky.zip"
  name "offiky"
  desc "Menu bar app that puts coworkers' pixel characters on your desktop floor"
  homepage "https://github.com/supungbab/offiky"

  depends_on macos: ">= :sonoma"

  app "offiky.app"

  # 공증하지 않아 Gatekeeper 가 첫 실행을 막는다. 설치 직후 격리 속성만 지운다
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/offiky.app"],
                   sudo: false
  end

  zap trash: "~/Library/Containers/com.offiky.app"
end
