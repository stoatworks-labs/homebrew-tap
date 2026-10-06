cask "presentation-commander-server" do
  version "1.1.3"

  on_arm do
    sha256 "759e07024fb24c0430e2453d883662b32f5bd43547e25cc612ab605135bfbf58"

    url "https://github.com/stoatworks-labs/presentation-commander-server/releases/download/v#{version}/presentation-commander-server-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "7a174f6c1abedf2cc3cab497e6d79f2586a2e9c380a5141426359b55ef79d7bd"

    url "https://github.com/stoatworks-labs/presentation-commander-server/releases/download/v#{version}/presentation-commander-server-#{version}-x64.dmg"
  end

  name "Presentation Commander — Server"
  desc "NDI matrix for live events"
  homepage "https://stoatworks-labs.com/software/presentation-commander-server/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Presentation Commander Server.app"

  zap trash: [
    "~/Library/Application Support/com.presentationcommander.server",
    "~/Library/Application Support/Presentation Commander Server",
    "~/Library/Preferences/com.presentationcommander.server.plist",
    "~/Library/Saved Application State/com.presentationcommander.server.savedState",
  ]
end
