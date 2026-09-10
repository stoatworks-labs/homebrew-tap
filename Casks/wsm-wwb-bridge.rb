cask "wsm-wwb-bridge" do
  version "1.1.1"

  on_arm do
    sha256 "0a7fba7270f340dc2b50de2182e2590d47fb28a7e029a33c9cb699e9e16abf66"
    url "https://github.com/stoatworks-labs/wsm-wwb-bridge/releases/download/v#{version}/wsm-wwb-bridge-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "c8f7ee0a90df1e67645bd3f6b1541f16e161ddb05ad0b8fe4303b42c3f7ec080"
    url "https://github.com/stoatworks-labs/wsm-wwb-bridge/releases/download/v#{version}/wsm-wwb-bridge-#{version}-macos-x86_64.dmg"
  end

  name "WSM–WWB Bridge"
  desc "Shure to Sennheiser, both ways"
  homepage "https://stoatworks-labs.com/software/wsm-wwb-bridge/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "wsm-wwb-bridge.app"
end
