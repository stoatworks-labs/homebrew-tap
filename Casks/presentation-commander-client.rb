cask "presentation-commander-client" do
  version "1.3.1"

  on_arm do
    sha256 "bbba5535b00bb219c9dd6230b45c52f3945a15baa4443a1867670feb1c5cdccb"

    url "https://github.com/stoatworks-labs/presentation-commander-client/releases/download/v#{version}/presentation-commander-client-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2da7bb6fc6d9f33578e0dc3e6ab15845f27313a5e01af8a6293e632620673f6d"

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
