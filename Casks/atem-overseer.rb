cask "atem-overseer" do
  version "0.3.4"

  on_arm do
    sha256 "c38db7efb638406bca692e4d5e78175354314394f3cae4303e1968999c38052e"
    url "https://github.com/stoatworks-labs/atem-overseer/releases/download/v#{version}/atem-overseer-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "0c6175dbb490cb853360a07a76c31481abdb114e30d7be090c53b6410e2bc6ae"
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
