cask "offiky" do
  version "2.54.0"
  sha256 "a8262c478aa0fa235e6f0ad8e22178f41c4a763852a2d443b83e493e334ed110"

  url "https://github.com/supungbab/offiky/releases/download/v#{version}/Offiky.zip"
  name "Offiky"
  desc "Menu bar app that puts coworkers' pixel characters on your desktop floor"
  homepage "https://github.com/supungbab/offiky"

  depends_on macos: :sonoma

  app "Offiky.app"

  # 공증하지 않아 Gatekeeper 가 첫 실행을 막는다. 설치 직후 격리 속성만 제거한다
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Offiky.app"]
  end

  # 실행 중인 앱 위에 파일만 덮으면 프로세스는 옛 코드로 계속 돈다.
  # 껐다 켜기 전까지 새 버전이 아니다.
  uninstall quit: "com.offiky.app"

  zap trash: "~/Library/Containers/com.offiky.app"
end
