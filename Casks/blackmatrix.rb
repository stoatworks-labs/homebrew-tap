cask "blackmatrix" do
  version "0.4.0"
  sha256 "2f2694f9f6bfb62bc7e19c04d1cd059f7d8ba0ebb7b0924755f52aab373b4b63"

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
