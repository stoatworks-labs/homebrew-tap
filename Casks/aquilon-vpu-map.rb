cask "aquilon-vpu-map" do
  version "1.3.1"
  sha256 "48cda8bd6c8636a496d8fa4e77ed8eabf9e5475c069eec5a5992535e68b0640f"

  url "https://github.com/stoatworks-labs/aquilon-vpu-map/releases/download/v#{version}/Aquilon.VPU.Map_#{version}_universal.dmg"
  name "Aquilon VPU Map"
  desc "Where every mixer in the chassis went"
  homepage "https://stoatworks-labs.com/software/aquilon-vpu-map/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Aquilon VPU Map.app"

  zap trash: [
    "~/Library/Application Support/Aquilon VPU Map",
    "~/Library/Application Support/com.stoatworkslabs.aquilon-vpu-map",
    "~/Library/Preferences/com.stoatworkslabs.aquilon-vpu-map.plist",
    "~/Library/Saved Application State/com.stoatworkslabs.aquilon-vpu-map.savedState",
  ]
end
