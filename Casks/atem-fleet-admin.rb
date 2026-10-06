cask "atem-fleet-admin" do
  version "0.4.7"
  sha256 "6c4c22d8126ebb0fb72f740f8345a74c5818ab3c53dd99b6df7bac966f4ee1b6"

  url "https://github.com/stoatworks-labs/atem-fleet-admin/releases/download/v#{version}/atem-fleet-admin-#{version}-macos-universal.dmg"
  name "ATEM Fleet Admin"
  desc "Provision every ATEM at once"
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
