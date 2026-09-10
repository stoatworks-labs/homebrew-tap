cask "blackmatrix" do
  version "0.3.0"

  on_arm do
    sha256 "ed9aae6d53d817a047b441fcd753118282c1db5ab729cc4a31b5fe2b1e2fea81"
    url "https://github.com/stoatworks-labs/blackmatrix/releases/download/v#{version}/BlackMatrix_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "44e57edd48b85bb7e4a3eebdc6d06ce89d9fc7d48e1c0aa13c93a15078397ef3"
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
