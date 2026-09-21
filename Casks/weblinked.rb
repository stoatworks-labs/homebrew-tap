cask "weblinked" do
  version "1.0.4"
  sha256 "33918b8a19845fb1c2b2d55ed7ab2eb90754b5ae63d6e1a5b06a9e8b88aba58c"
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
