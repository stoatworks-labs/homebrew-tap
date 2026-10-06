cask "peephole" do
  version "0.1.1"
  sha256 "60d7b03195e98425eb825a89af95dda4b33599421cb9599982564629c4a5a362"

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
