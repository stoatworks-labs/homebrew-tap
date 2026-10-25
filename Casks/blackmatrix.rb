cask "blackmatrix" do
  version "0.4.2"
  sha256 "63796816e7ad5ccdbb10f9a35533096c781a865475ab71c730bd004d57af4b90"

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
