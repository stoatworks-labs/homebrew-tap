cask "presentation-commander-client" do
  version "1.3.0"

  on_arm do
    sha256 "179f0382f28d11b3d277c1cc3c92c300b2db4c5e4272af103c9f9c93859e99d1"
    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "5d4e8722ad97ff0fb66bbbff1b4db46a3501ef12ae4b85f95bd2e2bdc54c1692"
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
