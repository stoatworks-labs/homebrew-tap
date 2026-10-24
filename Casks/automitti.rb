cask "automitti" do
  version "0.2.1"
  sha256 "96e7fc614b5e8484a17559c7b57ef2684ffa956439a317870ceaaa7d666800fa"

  url "https://github.com/stoatworks-labs/automitti/releases/download/v#{version}/automitti-#{version}-macos-universal.dmg"
  name "automitti"
  desc "Mitti on switchers it's never heard of (preview)"
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
