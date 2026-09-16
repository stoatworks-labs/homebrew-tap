cask "srt-router" do
  version "0.2.3"
  sha256 "f050bde7a0c3fd77c9c270e270165098e6026e162f6bb94ea63058890883df67"
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
