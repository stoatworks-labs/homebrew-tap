cask "weblinked" do
  version "1.2.0"
  sha256 "e6b26024007cbd61d7560a6a387168cf773cd0b71bed7581ab8580a8a8002f10"

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
    "~/Library/Application Support/com.stoatworks.ffgl.weblinked",
    "~/Library/Application Support/WebLinked",
    "~/Library/Application Support/works.stoat.weblinked",
    "~/Library/Preferences/com.stoatworks.ffgl.weblinked.plist",
    "~/Library/Preferences/works.stoat.weblinked.plist",
    "~/Library/Saved Application State/com.stoatworks.ffgl.weblinked.savedState",
    "~/Library/Saved Application State/works.stoat.weblinked.savedState",
  ]
end
