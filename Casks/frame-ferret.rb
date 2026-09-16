cask "frame-ferret" do
  version "0.2.3"
  sha256 "b14784e669f761ae11bf1247733cddb8a6e98cdd76aaa96676f7bba76c14e364"
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
