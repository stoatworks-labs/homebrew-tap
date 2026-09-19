cask "resolve-configurator" do
  version "0.1.6"
  sha256 "7bcba96fd7a5c22234993db7c61b2edef461c47fb6889fb0e892c1a08025da0b"
  url "https://github.com/stoatworks-labs/resolve-configurator/releases/download/v#{version}/resolve-configurator-#{version}-macos-universal.dmg"

  name "Resolve Configurator"
  desc "Build a Resolve project from CSV"
  homepage "https://stoatworks-labs.com/software/resolve-configurator/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "resolve-configurator-gui.app"
end
