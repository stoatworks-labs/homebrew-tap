cask "srt-router" do
  version "0.2.6"
  sha256 "4bd44aff807194162bef462011c0d565cb354bef8a0f8f7bfe0431c8ddbaa13a"

  url "https://github.com/stoatworks-labs/srt-router/releases/download/v#{version}/srt-router-#{version}-macos-app.dmg"
  name "SRT Router"
  desc "Broadcast-style crosspoint for SRT"
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
