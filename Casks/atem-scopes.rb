cask "atem-scopes" do
  version "0.2.1"

  on_arm do
    sha256 "17ff237449940796deb905638a17a7300fff84fe1a79b9188a7abcd6b29b31b6"
    url "https://github.com/stoatworks-labs/atem-scopes/releases/download/v#{version}/atem-scopes-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "28e7f6dabc4e3cdde20c873a3c0686d58181683cf081299e84bfced2a616d184"
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
