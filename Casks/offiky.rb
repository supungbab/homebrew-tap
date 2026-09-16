cask "offiky" do
  version "1.0.5"
  sha256 "97034658d3c7cff25947a9541b08ed847caddc939d4da4d04524a83cc80db7df"

  url "https://github.com/supungbab/offiky/releases/download/v#{version}/Offiky.zip"
  name "Offiky"
  desc "Menu bar app that puts coworkers' pixel characters on your desktop floor"
  homepage "https://github.com/supungbab/offiky"

  depends_on macos: :sonoma

  app "Offiky.app"

  # 공증하지 않아 Gatekeeper 가 첫 실행을 막는다. 설치 직후 격리 속성만 지운다.
  # postflight_steps 로는 못 옮긴다 — appdir 을 가리킬 템플릿 토큰이 없어서
  # /Applications 를 하드코딩해야 하고, appdir 을 바꿔 쓰면 조용히 실패한다
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Offiky.app"],
                   sudo: false
  end

  # 실행 중인 앱 위에 파일만 덮으면 프로세스는 옛 코드로 계속 돈다.
  # 껐다 켜기 전까지 새 버전이 아니다.
  uninstall quit: "com.offiky.app"

  zap trash: "~/Library/Containers/com.offiky.app"
end
