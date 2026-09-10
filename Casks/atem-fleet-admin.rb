cask "atem-fleet-admin" do
  version "0.4.3"
  sha256 "d7deaceed197373216cb3c6854fe7720cba7b6e7e81b968cb31ac956ff53d654"
  url "https://github.com/stoatworks-labs/atem-fleet-admin/releases/download/v#{version}/ATEM.Fleet.Admin-#{version}.dmg",
      verified: "github.com/stoatworks-labs/atem-fleet-admin/"

  name "ATEM Fleet Admin"
  desc "Provision every ATEM at once"
  homepage "https://stoatworks-labs.com/software/atem-fleet-admin/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "ATEM Fleet Admin.app"

  zap trash: [
    "~/Library/Application Support/ATEM Fleet Admin",
    "~/Library/Application Support/com.allansargeant.atem-fleet-admin",
    "~/Library/Preferences/com.allansargeant.atem-fleet-admin.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-fleet-admin.savedState",
  ]
end
