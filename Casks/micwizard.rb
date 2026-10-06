cask "micwizard" do
  version "0.2.3"
  sha256 "585d29a03e481ea3bac4fe2791dc889d7fef4efd3c098765174f5971ec609edc"

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
