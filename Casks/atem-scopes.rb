cask "atem-scopes" do
  version "0.2.3"

  on_arm do
    sha256 "f8f96111c4934c8b7137c4c6a60928994a6eeab29f5d27667dc1b1b494a1c392"

    url "https://github.com/stoatworks-labs/atem-scopes/releases/download/v#{version}/atem-scopes-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "d1209fcaaa9f1b183e1a5c9647e0e1c7141834fd642c0f071e5414b21ecb898c"

    url "https://github.com/stoatworks-labs/atem-scopes/releases/download/v#{version}/atem-scopes-#{version}.dmg"
  end

  name "atem-scopes"
  desc "Scopes around an ATEM multiview"
  homepage "https://stoatworks-labs.com/software/atem-scopes/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "atem-scopes.app"

  zap trash: [
    "~/Library/Application Support/atem-scopes",
    "~/Library/Application Support/com.stoatworks.atem-scopes",
    "~/Library/Preferences/com.stoatworks.atem-scopes.plist",
    "~/Library/Saved Application State/com.stoatworks.atem-scopes.savedState",
  ]
end
