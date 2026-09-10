cask "weblinked" do
  version "1.0.3"
  sha256 "91c3904b01752c4d64e841520c2a78fbbd68337d0576aa1c7e197c7fe2db02a4"
  url "https://github.com/stoatworks-labs/weblinked/releases/download/v#{version}/weblinked-engine-#{version}-macos-arm64.dmg",
      verified: "github.com/stoatworks-labs/weblinked/"

  name "WebLinked"
  desc "URL in, SDI, NDI and a screen out"
  homepage "https://stoatworks-labs.com/software/weblinked/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

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
