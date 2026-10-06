cask "animatem" do
  version "0.2.2"

  on_arm do
    sha256 "7e62736e8d4fa116efd82b3208859d718c5027096ff5ca75766700e7c636499a"

    url "https://github.com/stoatworks-labs/animATEM/releases/download/v#{version}/animATEM-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1d942daea00c69f08519c479902381a36c06e195f9c1711826458556a79d2883"

    url "https://github.com/stoatworks-labs/animATEM/releases/download/v#{version}/animATEM-#{version}.dmg"
  end

  name "animATEM"
  desc "ATEM control with DVE preview"
  homepage "https://stoatworks-labs.com/software/animatem/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "animATEM.app"

  zap trash: [
    "~/Library/Application Support/animATEM",
    "~/Library/Application Support/com.allansargeant.animatem",
    "~/Library/Preferences/com.allansargeant.animatem.plist",
    "~/Library/Saved Application State/com.allansargeant.animatem.savedState",
  ]
end
