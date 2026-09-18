cask "frame-ferret" do
  version "0.2.5"
  sha256 "e88e0e6acab0414e2a494ae02ff44b31fda9ad98b68ed31fd28704c0cf5b658f"
  url "https://github.com/stoatworks-labs/frame-ferret/releases/download/v#{version}/frame-ferret-#{version}-macos-universal.dmg"

  name "Frame Ferret"
  desc "Software virtual capture card"
  homepage "https://stoatworks-labs.com/software/frame-ferret/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Frame Ferret.app"

  zap trash: [
    "~/Library/Application Support/Frame Ferret",
    "~/Library/Application Support/com.allansargeant.frame-ferret",
    "~/Library/Preferences/com.allansargeant.frame-ferret.plist",
    "~/Library/Saved Application State/com.allansargeant.frame-ferret.savedState",
  ]
end
