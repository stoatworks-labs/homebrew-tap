cask "atem-scopes" do
  version "0.2.4"

  on_arm do
    sha256 "9477ad379a75a35a71870e06436648fc0e1a04c0b2955966fd169b62866f9771"

    url "https://github.com/stoatworks-labs/atem-scopes/releases/download/v#{version}/atem-scopes-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ec9d3c5f5cd353ded95373179028a785f9a60050d79e74c80415804ae6d75108"

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
