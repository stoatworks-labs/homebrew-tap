cask "weblinked" do
  version "1.1.0"
  sha256 "eedd1e7f5ede4cda35d68cd8f7230cc071c3b90fea321c800fe83097bf73ea31"
  url "https://github.com/stoatworks-labs/weblinked/releases/download/v#{version}/weblinked-engine-#{version}-macos-arm64.dmg"

  name "WebLinked"
  desc "URL in, SDI, NDI and a screen out"
  homepage "https://stoatworks-labs.com/software/weblinked/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "WebLinked.app"

  zap trash: [
    "~/Library/Application Support/WebLinked",
    "~/Library/Application Support/com.stoatworks.ffgl.weblinked",
    "~/Library/Preferences/com.stoatworks.ffgl.weblinked.plist",
    "~/Library/Saved Application State/com.stoatworks.ffgl.weblinked.savedState",
    "~/Library/Application Support/works.stoat.weblinked",
    "~/Library/Preferences/works.stoat.weblinked.plist",
    "~/Library/Saved Application State/works.stoat.weblinked.savedState",
  ]
end
