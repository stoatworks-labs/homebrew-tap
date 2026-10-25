cask "atem-fleet-admin" do
  version "0.4.8"
  sha256 "01d52bbcf83ecc681445cad6699091513de8a3a7e298884910b87931db75c292"

  url "https://github.com/stoatworks-labs/atem-fleet-admin/releases/download/v#{version}/atem-fleet-admin-#{version}-macos-universal.dmg"
  name "ATEM Fleet Admin"
  desc "Set up every ATEM in the fleet at once"
  homepage "https://stoatworks-labs.com/software/atem-fleet-admin/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ATEM Fleet Admin.app"

  zap trash: [
    "~/Library/Application Support/ATEM Fleet Admin",
    "~/Library/Application Support/com.allansargeant.atem-fleet-admin",
    "~/Library/Preferences/com.allansargeant.atem-fleet-admin.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-fleet-admin.savedState",
  ]
end
