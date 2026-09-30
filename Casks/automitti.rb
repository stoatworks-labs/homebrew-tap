cask "automitti" do
  version "0.1.0"
  sha256 "01b2c2431b5c3d40f6fdc3b80efebf2d1c15a155322972eba1d5ddbb419489cc"
  url "https://github.com/stoatworks-labs/automitti/releases/download/v#{version}/automitti-#{version}-macos-universal.dmg"

  name "automitti"
  desc "Mitti on any switcher (preview)"
  homepage "https://stoatworks-labs.com/software/automitti/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "automitti.app"

  zap trash: [
    "~/Library/Application Support/automitti",
    "~/Library/Application Support/com.allansargeant.automitti",
    "~/Library/Preferences/com.allansargeant.automitti.plist",
    "~/Library/Saved Application State/com.allansargeant.automitti.savedState",
  ]
end
