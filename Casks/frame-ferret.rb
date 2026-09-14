cask "frame-ferret" do
  version "0.2.2"
  sha256 "8cd15603e4870191fc9f7254a787d12440ede45b69981f75d05fbfca3cd4c079"
  url "https://github.com/stoatworks-labs/frame-ferret/releases/download/v#{version}/Frame.Ferret_#{version}_aarch64.dmg"

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
