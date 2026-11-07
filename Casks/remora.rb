cask "remora" do
  version "0.4.0"
  sha256 "90ab7aeeb7cc3d6269e9b59e2b8354e56055b00070aad849a390d50b0f852bf8"

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
