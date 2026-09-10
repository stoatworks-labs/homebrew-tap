cask "simplevis" do
  version "0.4.1"

  on_arm do
    sha256 "c68377fb486366d9c60eaeb1a064bcb7ee1372b35e3c409a5bc1bcfeb6c13413"
    url "https://github.com/stoatworks-labs/simpleVIS/releases/download/v#{version}/simpleVIS_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "06acff71f68c8ecba022325339f93f61b987a635121bfc99f6f85a10dc81a0f9"
    url "https://github.com/stoatworks-labs/simpleVIS/releases/download/v#{version}/simpleVIS_#{version}_x64.dmg"
  end

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
