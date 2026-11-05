cask "remora" do
  version "0.3.0"
  sha256 "daf61f75ebe510f59764b6104dd4c41c01ca8b639a1395e383977b29b4f42652"

  url "https://github.com/stoatworks-labs/remora/releases/download/v#{version}/remora-#{version}-macos-universal.dmg"
  name "Remora"
  desc "Waves SuperRack follows the desk's selected channel"
  homepage "https://stoatworks-labs.com/software/remora/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Remora.app"
end
