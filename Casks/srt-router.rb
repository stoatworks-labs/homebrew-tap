cask "srt-router" do
  version "0.2.7"
  sha256 "47a9d40f9d0c7ee41f4cd973de57071cdf7c4bf98901bce316c84567561034d3"

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
