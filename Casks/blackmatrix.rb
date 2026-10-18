cask "blackmatrix" do
  version "0.4.1"
  sha256 "07ee36250d3d9a790b495d68881f6586ea54d98f54eb946dce1c30c0dd0f549e"

  url "https://github.com/stoatworks-labs/blackmatrix/releases/download/v#{version}/blackmatrix-#{version}-macos-universal.dmg"
  name "BlackMatrix"
  desc "ATEM fleet as one router, with failover"
  homepage "https://stoatworks-labs.com/software/blackmatrix/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "BlackMatrix.app"

  zap trash: [
    "~/Library/Application Support/BlackMatrix",
    "~/Library/Application Support/com.allansargeant.blackmatrix",
    "~/Library/Preferences/com.allansargeant.blackmatrix.plist",
    "~/Library/Saved Application State/com.allansargeant.blackmatrix.savedState",
  ]
end
