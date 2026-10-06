cask "simplevis" do
  version "0.4.3"
  sha256 "a46f4e56425a234a0fa21471ebe03c50e31f0624c7f9a5a8176e0003792a6fa3"

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
