cask "animatem" do
  version "0.2.3"

  on_arm do
    sha256 "c01b8151d0e6fe9de0dff58c7b4cfcbcba13f2a8b6a2098f9c829b9ff21a23f1"

    url "https://github.com/stoatworks-labs/animATEM/releases/download/v#{version}/animATEM-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "e29bca89e29e59ecd0a9bb67c1803ecf2c2e14daeeffa41d769340d164285d47"

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
