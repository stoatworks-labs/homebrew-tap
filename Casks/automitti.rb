cask "automitti" do
  version "0.1.1"
  sha256 "7fe0c9be9c5081dd856f00bedfe4c5de50532d24c4e05f2d53efc87a416bceea"

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
