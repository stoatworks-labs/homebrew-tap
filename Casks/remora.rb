cask "remora" do
  version "0.5.0"
  sha256 "68faa28bb01a9691c9a01b42418a4fb65600dca386fd090458d3de7862b79893"

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
