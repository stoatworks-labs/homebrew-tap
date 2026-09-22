cask "peephole" do
  version "0.1.0"
  sha256 "53310272391c70c636853b771f287851c1288561f65404ff7f07022fe5d62790"
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
