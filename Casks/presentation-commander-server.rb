cask "presentation-commander-server" do
  version "1.1.4"

  on_arm do
    sha256 "b05f1131912438f716efb2935ac51f543a84ef6d12d3f6a2c626ec28d3ebdc50"

    url "https://github.com/stoatworks-labs/presentation-commander-server/releases/download/v#{version}/presentation-commander-server-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "77642f5e93a06e0cdf13044a04bd3c2e33e2e41085a56de4a8c22d7227ebd068"

    url "https://github.com/stoatworks-labs/presentation-commander-server/releases/download/v#{version}/presentation-commander-server-#{version}-x64.dmg"
  end

  name "Presentation Commander — Server"
  desc "Master control for a presentation room, over NDI"
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
