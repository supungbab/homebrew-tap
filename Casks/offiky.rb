cask "offiky" do
  version "1.0.3"
  sha256 "ddccdb350607ed1aec62450fec6c61a55a68acd0b48e94238c22127e79454ea2"

  url "https://github.com/supungbab/offiky/releases/download/v#{version}/offiky.zip"
  name "offiky"
  desc "Menu bar app that puts coworkers' pixel characters on your desktop floor"
  homepage "https://github.com/supungbab/offiky"

  depends_on macos: :sonoma

  app "offiky.app"

  # 공증하지 않아 Gatekeeper 가 첫 실행을 막는다. 설치 직후 격리 속성만 지운다.
  # postflight_steps 로는 못 옮긴다 — appdir 을 가리킬 템플릿 토큰이 없어서
  # /Applications 를 하드코딩해야 하고, appdir 을 바꿔 쓰면 조용히 실패한다
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/offiky.app"],
                   sudo: false
  end

  zap trash: "~/Library/Containers/com.offiky.app"
end
