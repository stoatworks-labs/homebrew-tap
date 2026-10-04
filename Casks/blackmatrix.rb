cask "blackmatrix" do
  version "0.3.4"
  sha256 "8aaa181522dd7c88579914ba135cd6a2726137cd4d5bb22757c3fb98289cbb64"

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
