cask "offiky" do
  version "2.59.1"
  sha256 "3dcc3be49d74d1d601c2284703d8b1cd2d9bbd63000367272b0e987e3b4eace2"

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
