cask "presentation-commander-server" do
  version "1.1.2"

  on_arm do
    sha256 "acd1f682a02f8e46db94169c2b34420155441989addc4e9573d9e0e485fb5d4a"
    url "https://github.com/stoatworks-labs/presentation-commander-server/releases/download/v#{version}/presentation-commander-server-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "5309e7bcf985a234f17e2f577ba015f9afa9d0a454c3130e1c9b598090f86f02"
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
    "~/Library/Application Support/Presentation Commander Server",
    "~/Library/Application Support/com.presentationcommander.server",
    "~/Library/Preferences/com.presentationcommander.server.plist",
    "~/Library/Saved Application State/com.presentationcommander.server.savedState",
  ]
end
