cask "atem-overseer" do
  version "0.3.3"

  on_arm do
    sha256 "849bd2a2803db9052663e174443978baca4bc3bc99b1f602a74d821a8a3e209e"
    url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "b2d4a043b8291e582db143329235bb3545ab3a149a87b088d3677ace883a5fd8"
    url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-x86_64.dmg"
  end

  name "ATEM Overseer"
  desc "ATEM fleet dashboard"
  homepage "https://stoatworks-labs.com/software/atem-overseer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Atem Overseer.app"

  zap trash: [
    "~/Library/Application Support/Atem Overseer",
    "~/Library/Application Support/com.allansargeant.atem-overseer",
    "~/Library/Preferences/com.allansargeant.atem-overseer.plist",
    "~/Library/Saved Application State/com.allansargeant.atem-overseer.savedState",
  ]
end
