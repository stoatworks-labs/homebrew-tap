cask "blackmatrix" do
  version "0.3.3"
  sha256 "ce03051f05791bc27946c3988a3f812b84fe338a89ba7a949f1928807a9a1dbe"
  url "https://github.com/stoatworks-labs/blackmatrix/releases/download/v#{version}/blackmatrix-#{version}-macos-universal.dmg"

  name "BlackMatrix"
  desc "ATEM fleet as one router, with failover"
  homepage "https://stoatworks-labs.com/software/blackmatrix/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "BlackMatrix.app"

  zap trash: [
    "~/Library/Application Support/BlackMatrix",
    "~/Library/Application Support/com.allansargeant.blackmatrix",
    "~/Library/Preferences/com.allansargeant.blackmatrix.plist",
    "~/Library/Saved Application State/com.allansargeant.blackmatrix.savedState",
  ]
end
