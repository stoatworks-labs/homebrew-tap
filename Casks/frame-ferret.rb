cask "frame-ferret" do
  version "0.2.6"
  sha256 "fe0bc71138fe2c4917aaf4ecb627bf302aaaee785c47aa8c34d7af17dc1ea27f"

  url "https://github.com/stoatworks-labs/frame-ferret/releases/download/v#{version}/frame-ferret-#{version}-macos-universal.dmg"
  name "Frame Ferret"
  desc "Software virtual capture card"
  homepage "https://stoatworks-labs.com/software/frame-ferret/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Frame Ferret.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.frame-ferret",
    "~/Library/Application Support/Frame Ferret",
    "~/Library/Preferences/com.allansargeant.frame-ferret.plist",
    "~/Library/Saved Application State/com.allansargeant.frame-ferret.savedState",
  ]
end
