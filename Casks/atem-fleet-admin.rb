cask "atem-fleet-admin" do
  version "0.4.6"
  sha256 "a0b86fd125530a7a5e7ae6f7487bc46e5de9603ce6bcccb2bb91b4c90895c291"
  url "https://github.com/stoatworks-labs/atem-fleet-admin/releases/download/v#{version}/atem-fleet-admin-#{version}-macos-universal.dmg"

  name "ATEM Fleet Admin"
  desc "Provision every ATEM at once"
  homepage "https://stoatworks-labs.com/software/atem-fleet-admin/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "ATEM Fleet Admin.app"

  zap trash: [
    "~/Library/Application Support/ATEM Fleet Admin",
    "~/Library/Application Support/com.allansargeant.atem-fleet-admin",
    "~/Library/Preferences/com.allansargeant.atem-fleet-admin.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-fleet-admin.savedState",
  ]
end
