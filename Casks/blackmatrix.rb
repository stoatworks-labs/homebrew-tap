cask "blackmatrix" do
  version "0.3.1"

  on_arm do
    sha256 "46f06bf984541c186923b21a6826a0b63dc23edd35d33b50e2cd9c8a4da93eee"
    url "https://github.com/stoatworks-labs/blackmatrix/releases/download/v#{version}/BlackMatrix_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "41f18a41f353c165e4d90db9d4eabef16eedfaaca0e88a7d8f4622c2365ce204"
    url "https://github.com/stoatworks-labs/blackmatrix/releases/download/v#{version}/BlackMatrix_#{version}_x64.dmg"
  end

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
