cask "simplevis" do
  version "0.4.2"
  sha256 "7f74ce9a2fe5023a1f0d7bbe8806d83a8261b9d8851db55a8bc009c242645817"
  url "https://github.com/stoatworks-labs/simpleVIS/releases/download/v#{version}/simpleVIS_#{version}_universal.dmg"

  name "simpleVIS"
  desc "See your lighting programming, before the room"
  homepage "https://stoatworks-labs.com/software/simplevis/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "simpleVIS.app"

  zap trash: [
    "~/Library/Application Support/simpleVIS",
    "~/Library/Application Support/com.allansargeant.simplevis",
    "~/Library/Preferences/com.allansargeant.simplevis.plist",
    "~/Library/Saved Application State/com.allansargeant.simplevis.savedState",
  ]
end
