cask "presentation-commander-client" do
  version "1.3.0"

  on_arm do
    sha256 "ee4e3f9f15a3c20113826a0d76bc54fda2918f6188322dfdc01572b6388f585b"

    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "b4b0875058c7f47acd0a8f9fb1fbf40d9694385946c1dae316183a85b348f758"

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
