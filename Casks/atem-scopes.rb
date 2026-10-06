cask "atem-scopes" do
  version "0.2.2"

  on_arm do
    sha256 "4b66b42b618785952c128cb4c9695169b9d421b402ebb220d911e51fc909578c"

    url "https://github.com/stoatworks-labs/atem-scopes/releases/download/v#{version}/atem-scopes-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "aa3b3a31df1e31cf10bd827ff7613d3df79c9e036911912da410f65008d6b677"

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
