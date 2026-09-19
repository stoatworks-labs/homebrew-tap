cask "aquilon-vpu-map" do
  version "1.3.0"
  sha256 "fcba7f03c89dec5e052191cace5308d39ba5bf4afc1688c735d99d789da7907b"
  url "https://github.com/stoatworks-labs/aquilon-vpu-map/releases/download/v#{version}/Aquilon.VPU.Map_#{version}_universal.dmg"

  name "Aquilon VPU Map"
  desc "Where every mixer in the chassis went"
  homepage "https://stoatworks-labs.com/software/aquilon-vpu-map/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Aquilon VPU Map.app"

  zap trash: [
    "~/Library/Application Support/Aquilon VPU Map",
    "~/Library/Application Support/com.stoatworkslabs.aquilon-vpu-map",
    "~/Library/Preferences/com.stoatworkslabs.aquilon-vpu-map.plist",
    "~/Library/Saved Application State/com.stoatworkslabs.aquilon-vpu-map.savedState",
  ]
end
