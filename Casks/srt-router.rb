cask "srt-router" do
  version "0.2.5"
  sha256 "dc9000b5fb6d545b42a1177be72358823e0a51cd433c74987dd34c7129617978"

  url "https://github.com/stoatworks-labs/srt-router/releases/download/v#{version}/srt-router-#{version}-macos-app.dmg"
  name "SRT Router"
  desc "SRT crosspoint router"
  homepage "https://stoatworks-labs.com/software/srt-router/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "SRT Router.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.srt-router",
    "~/Library/Application Support/com.allansargeant.srt-router-launcher",
    "~/Library/Application Support/SRT Router",
    "~/Library/Preferences/com.allansargeant.srt-router-launcher.plist",
    "~/Library/Preferences/com.allansargeant.srt-router.plist",
    "~/Library/Saved Application State/com.allansargeant.srt-router-launcher.savedState",
    "~/Library/Saved Application State/com.allansargeant.srt-router.savedState",
  ]
end
