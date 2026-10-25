cask "peephole" do
  version "0.1.2"
  sha256 "1d02f34811c2493cf4a008fbdb65ec21fcf27932a08f54ddb202d8c2916b5be7"

  url "https://github.com/stoatworks-labs/peephole/releases/download/v#{version}/peephole-#{version}-macos-universal.dmg"
  name "Peephole"
  desc "Camera or capture card, full screen"
  homepage "https://stoatworks-labs.com/software/peephole/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Peephole.app"
end
