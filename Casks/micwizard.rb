cask "micwizard" do
  version "0.2.2"
  sha256 "eccb7d51cc1b3457d13d16cf6162d46c4b895ae6718085dd0ddb864b2e364651"
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
    "~/Library/Application Support/MicWizard",
    "~/Library/Application Support/com.allansargeant.micwizard",
    "~/Library/Preferences/com.allansargeant.micwizard.plist",
    "~/Library/Saved Application State/com.allansargeant.micwizard.savedState",
  ]
end
