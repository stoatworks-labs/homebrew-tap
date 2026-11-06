cask "remora" do
  version "0.3.1"
  sha256 "571f78f0a79b2d75536d1a87c9b4f7ff706b47281fcbcc2e38bc892e927eb540"

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
