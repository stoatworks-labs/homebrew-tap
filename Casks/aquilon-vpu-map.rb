cask "aquilon-vpu-map" do
  version "1.4.0"
  sha256 "12904b4e4d06227ddb5dc44848b0f9bfade7f0391cb4162ac7f57186e894a0f3"

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
