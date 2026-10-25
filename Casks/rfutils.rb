cask "rfutils" do
  version "0.5.2"
  sha256 "65d2e27f41320be97aa11c03b32629c4a4dc874b47506d6f2e08902c99796f03"

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
