cask "micwizard" do
  version "0.2.1"

  on_arm do
    sha256 "c02c0b52ba4f74c55c08fcac28b68c28414afa31ecce76629ab14b5251bc359e"
    url "https://github.com/stoatworks-labs/MicWizard/releases/download/v#{version}/micwizard-#{version}-arm64.dmg",
        verified: "github.com/stoatworks-labs/MicWizard/"
  end

  on_intel do
    sha256 "51bb0ec7eacb4a93fa1c5af02e0fd26350290b52348412ed4b2da8ca8a7493c3"
    url "https://github.com/stoatworks-labs/MicWizard/releases/download/v#{version}/micwizard-#{version}-x64.dmg",
        verified: "github.com/stoatworks-labs/MicWizard/"
  end

  name "MicWizard"
  desc "Wireless mic fleet monitor"
  homepage "https://stoatworks-labs.com/software/micwizard/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MicWizard.app"

  zap trash: [
    "~/Library/Application Support/MicWizard",
    "~/Library/Application Support/com.allansargeant.micwizard",
    "~/Library/Preferences/com.allansargeant.micwizard.plist",
    "~/Library/Saved Application State/com.allansargeant.micwizard.savedState",
  ]
end
