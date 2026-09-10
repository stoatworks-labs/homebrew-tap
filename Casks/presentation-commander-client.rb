cask "presentation-commander-client" do
  version "1.2.2"

  on_arm do
    sha256 "f60e13b0047d052a2086e202ebe086bac3feeed648fc3c47aa2a8b9b103b1c41"
    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "7a7bc584fe26a86614c0a7be43aee4d84f36f0c3fe7f7b2af4cef1b0784099a2"
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
    "~/Library/Application Support/Presentation Commander Client",
    "~/Library/Application Support/com.presentationcommander.client",
    "~/Library/Preferences/com.presentationcommander.client.plist",
    "~/Library/Saved Application State/com.presentationcommander.client.savedState",
  ]
end
