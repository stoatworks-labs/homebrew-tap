cask "rfutils" do
  version "0.4.4"
  sha256 "37bfa055ebb1d2713f0d2e76b8842be5cd0d43843187f83c45b6558e9398040a"
  url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-universal.dmg"

  name "RFutils"
  desc "RF coordination & mic monitoring"
  homepage "https://stoatworks-labs.com/software/rfutils/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "RFutils.app"

  zap trash: [
    "~/Library/Application Support/RFutils",
    "~/Library/Application Support/com.allansargeant.rfutils",
    "~/Library/Preferences/com.allansargeant.rfutils.plist",
    "~/Library/Saved Application State/com.allansargeant.rfutils.savedState",
    "~/Library/Application Support/com.allansargeant.rfutils-launcher",
    "~/Library/Preferences/com.allansargeant.rfutils-launcher.plist",
    "~/Library/Saved Application State/com.allansargeant.rfutils-launcher.savedState",
  ]
end
