cask "offiky" do
  version "1.0.4"
  sha256 "3d98b8744d4ae132b19a086fbe731a68af952fa7f6ba4d0ef11a05922a58561c"

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

  zap trash: "~/Library/Containers/com.offiky.app"
end
