cask "resolve-configurator" do
  version "0.1.5"
  sha256 "242902551d3620ebb245d5184ed0db3c0f6d7dd8b5392a0953509ab42eb0912c"
  url "https://github.com/stoatworks-labs/resolve-configurator/releases/download/v#{version}/resolve-configurator-#{version}-macos-arm64.dmg",
      verified: "github.com/stoatworks-labs/resolve-configurator/"

  name "Resolve Configurator"
  desc "Build a Resolve project from CSV"
  homepage "https://stoatworks-labs.com/software/resolve-configurator/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "resolve-configurator-gui.app"
end
