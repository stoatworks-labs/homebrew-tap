cask "srt-router" do
  version "0.2.4"
  sha256 "85219d59f55fe3002fd36af2d9edb3511eaf8e45ca015dacad7456e8ffc53cae"
  url "https://github.com/stoatworks-labs/srt-router/releases/download/v#{version}/srt-router-#{version}-macos-app.dmg"

  name "SRT Router"
  desc "SRT crosspoint router"
  homepage "https://stoatworks-labs.com/software/srt-router/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "SRT Router.app"

  zap trash: [
    "~/Library/Application Support/SRT Router",
    "~/Library/Application Support/com.allansargeant.srt-router",
    "~/Library/Preferences/com.allansargeant.srt-router.plist",
    "~/Library/Saved Application State/com.allansargeant.srt-router.savedState",
    "~/Library/Application Support/com.allansargeant.srt-router-launcher",
    "~/Library/Preferences/com.allansargeant.srt-router-launcher.plist",
    "~/Library/Saved Application State/com.allansargeant.srt-router-launcher.savedState",
  ]
end
