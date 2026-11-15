cask "remora" do
  version "0.4.1"
  sha256 "cc55107d169cc4396162d765e820d3a49fd8afd5b558f2390853efea68c214c7"

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
