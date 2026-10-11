cask "automitti" do
  version "0.2.0"
  sha256 "613676e033c0720016c550a77ba7c152ec60577bce9b74354c8448cc83b5877c"

  url "https://github.com/stoatworks-labs/automitti/releases/download/v#{version}/automitti-#{version}-macos-universal.dmg"
  name "automitti"
  desc "Mitti on any switcher (preview)"
  homepage "https://stoatworks-labs.com/software/automitti/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "automitti.app"

  zap trash: [
    "~/Library/Application Support/automitti",
    "~/Library/Application Support/com.allansargeant.automitti",
    "~/Library/Preferences/com.allansargeant.automitti.plist",
    "~/Library/Saved Application State/com.allansargeant.automitti.savedState",
  ]
end
