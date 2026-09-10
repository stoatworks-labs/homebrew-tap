cask "animatem" do
  version "0.2.1"

  on_arm do
    sha256 "1e5488c091a7bb9cecc4128fd13530819c676fe0ca29ec005a7fe952ec37fa60"
    url "https://github.com/stoatworks-labs/animATEM/releases/download/v#{version}/animATEM-#{version}-arm64.dmg",
        verified: "github.com/stoatworks-labs/animATEM/"
  end

  on_intel do
    sha256 "c32e354b91793680d1f8896bb6c80c287e305086e31bf5e2ef90d0711c40c753"
    url "https://github.com/stoatworks-labs/animATEM/releases/download/v#{version}/animATEM-#{version}.dmg",
        verified: "github.com/stoatworks-labs/animATEM/"
  end

  name "animATEM"
  desc "ATEM control with DVE preview"
  homepage "https://stoatworks-labs.com/software/animatem/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "animATEM.app"

  zap trash: [
    "~/Library/Application Support/animATEM",
    "~/Library/Application Support/com.allansargeant.animatem",
    "~/Library/Preferences/com.allansargeant.animatem.plist",
    "~/Library/Saved Application State/com.allansargeant.animatem.savedState",
  ]
end
