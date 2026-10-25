cask "rfutils" do
  version "0.5.1"
  sha256 "4940ada926f014293a430a98d707c52cd6d34c9c69b0181c3c2fc5996992fd3b"

  url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-universal.dmg"
  name "RFutils"
  desc "RF coordination and radio-mic monitoring"
  homepage "https://stoatworks-labs.com/software/rfutils/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "RFutils.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.rfutils",
    "~/Library/Application Support/com.allansargeant.rfutils-launcher",
    "~/Library/Application Support/RFutils",
    "~/Library/Preferences/com.allansargeant.rfutils-launcher.plist",
    "~/Library/Preferences/com.allansargeant.rfutils.plist",
    "~/Library/Saved Application State/com.allansargeant.rfutils-launcher.savedState",
    "~/Library/Saved Application State/com.allansargeant.rfutils.savedState",
  ]
end
