cask "wsm-wwb-bridge" do
  version "1.1.2"
  sha256 "9f6aed0cce51b15ec3ffe19ec8243071724a60280220eeabd8cbf2eda0abf603"
  url "https://github.com/stoatworks-labs/wsm-wwb-bridge/releases/download/v#{version}/wsm-wwb-bridge-#{version}-macos-universal.dmg"

  name "WSM–WWB Bridge"
  desc "Shure to Sennheiser, both ways"
  homepage "https://stoatworks-labs.com/software/wsm-wwb-bridge/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "wsm-wwb-bridge.app"
end
