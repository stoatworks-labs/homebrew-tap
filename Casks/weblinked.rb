cask "weblinked" do
  version "1.3.0"
  sha256 "a56609fcc2bb67cf4ee5cebff9c88e48ad0f3d96325d0bf4a6b71ff8a70c562e"

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
