cask "presentation-commander-client" do
  version "1.3.2"

  on_arm do
    sha256 "948281e5117c938311dc023c4ced7be520732975885aa4180d3e03c9cddf1fb3"

    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "afa6a78914d394d21e1fe512262213b19b7b4c040614975228ad43e1b22a1276"

    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-x64.dmg"
  end

  name "Presentation Commander — Client"
  desc "Presenter for the stage laptop"
  homepage "https://stoatworks-labs.com/software/presentation-commander-client/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Presentation Commander Client.app"

  zap trash: [
    "~/Library/Application Support/com.presentationcommander.client",
    "~/Library/Application Support/Presentation Commander Client",
    "~/Library/Preferences/com.presentationcommander.client.plist",
    "~/Library/Saved Application State/com.presentationcommander.client.savedState",
  ]
end
