cask "weblinked" do
  version "1.3.1"
  sha256 "3d8759c8dbb05a1b2580d65b4ac9a9721eb833c910430837052d483db767a8c2"

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
