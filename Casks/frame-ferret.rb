cask "frame-ferret" do
  version "0.2.1"
  sha256 "95e4013ac1d22683f7bd6375407ebf6fcf7d377db978e303e191accb82e0205a"
  url "https://github.com/stoatworks-labs/frame-ferret/releases/download/v#{version}/Frame.Ferret_#{version}_aarch64.dmg",
      verified: "github.com/stoatworks-labs/frame-ferret/"

  name "Frame Ferret"
  desc "Software virtual capture card"
  homepage "https://stoatworks-labs.com/software/frame-ferret/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Frame Ferret.app"

  zap trash: [
    "~/Library/Application Support/Frame Ferret",
    "~/Library/Application Support/com.allansargeant.frame-ferret",
    "~/Library/Preferences/com.allansargeant.frame-ferret.plist",
    "~/Library/Saved Application State/com.allansargeant.frame-ferret.savedState",
  ]
end
