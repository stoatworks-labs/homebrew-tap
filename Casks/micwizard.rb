cask "micwizard" do
  version "0.2.2"
  sha256 "320b644bc762bd92ae615ec401e681bb6a0f11726d555ee752939368f9daa2cd"

  url "https://github.com/stoatworks-labs/MicWizard/releases/download/v#{version}/micwizard-#{version}-universal.dmg"
  name "MicWizard"
  desc "Wireless mic fleet monitor"
  homepage "https://stoatworks-labs.com/software/micwizard/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MicWizard.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.micwizard",
    "~/Library/Application Support/MicWizard",
    "~/Library/Preferences/com.allansargeant.micwizard.plist",
    "~/Library/Saved Application State/com.allansargeant.micwizard.savedState",
  ]
end
