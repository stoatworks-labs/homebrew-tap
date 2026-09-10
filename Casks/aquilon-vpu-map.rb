cask "aquilon-vpu-map" do
  version "1.2.1"

  on_arm do
    sha256 "b6db8a135943f13d19fb1045795d639a9d49cc328c11b71783bc8ef2db368393"
    url "https://github.com/stoatworks-labs/aquilon-vpu-map/releases/download/v#{version}/Aquilon.VPU.Map_#{version}_aarch64.dmg",
        verified: "github.com/stoatworks-labs/aquilon-vpu-map/"
  end

  on_intel do
    sha256 "1e5b4a4a238219cfa7de9476ec478a907e2b78557ab70fb7e391443d79ba2049"
    url "https://github.com/stoatworks-labs/aquilon-vpu-map/releases/download/v#{version}/Aquilon.VPU.Map_#{version}_x64.dmg",
        verified: "github.com/stoatworks-labs/aquilon-vpu-map/"
  end

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
