cask "weblinked" do
  version "1.0.5"
  sha256 "db3049abd75c6e973acbb6373ffd9c0415325c17a9f47e481f911d9629576711"
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
