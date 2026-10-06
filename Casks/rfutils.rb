cask "rfutils" do
  version "0.4.6"
  sha256 "256879baafdcf45cb1baad2619ec0d14b3c8d9bd05fdf3e3c379e26614088648"

  url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-universal.dmg"
  name "RFutils"
  desc "RF coordination & mic monitoring"
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
