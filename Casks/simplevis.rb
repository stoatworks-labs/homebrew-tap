cask "simplevis" do
  version "0.4.4"
  sha256 "ef23cc6f26a497f153db3e60944f624959a62197e9ade8b5ddd9905db03127e1"

  url "https://github.com/stoatworks-labs/simpleVIS/releases/download/v#{version}/simpleVIS_#{version}_universal.dmg"
  name "simpleVIS"
  desc "See your lighting programming, before the room"
  homepage "https://stoatworks-labs.com/software/simplevis/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "simpleVIS.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.simplevis",
    "~/Library/Application Support/simpleVIS",
    "~/Library/Preferences/com.allansargeant.simplevis.plist",
    "~/Library/Saved Application State/com.allansargeant.simplevis.savedState",
  ]
end
