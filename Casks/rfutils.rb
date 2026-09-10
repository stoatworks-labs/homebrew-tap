cask "rfutils" do
  version "0.4.3"

  on_arm do
    sha256 "5e309eb92df5dbe8500f3f8b0c3fdff8fd4f383b7555c6dfdc3109baf0307e77"
    url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "3333421c78c6a063df90388a00f79ffe44d5b2702a63403d9cbe150f53cf4b33"
    url "https://github.com/stoatworks-labs/RFutils/releases/download/v#{version}/rfutils-#{version}-macos-x86_64.dmg"
  end

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
