cask "livepremier-plus" do
  version "0.4.1"

  on_arm do
    sha256 "d3626333d62c0c4240eb3c6e9a93d72f3c1105c1c275eb15c0fe214243b901b9"
    url "https://github.com/stoatworks-labs/livepremier-plus/releases/download/v#{version}/livepremier-plus-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "f707eaf4bd644cff6cfd5d768245184fd4e118082d1d4977fd6f60d158b2a2f0"
    url "https://github.com/stoatworks-labs/livepremier-plus/releases/download/v#{version}/livepremier-plus-#{version}-macos-x86_64.dmg"
  end

  name "LivePremier Plus"
  desc "Your switcher's own interface, with the missing panels"
  homepage "https://stoatworks-labs.com/software/livepremier-plus/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "LivePremier Plus.app"

  zap trash: [
    "~/Library/Application Support/LivePremier Plus",
    "~/Library/Application Support/com.allansargeant.livepremier-plus",
    "~/Library/Preferences/com.allansargeant.livepremier-plus.plist",
    "~/Library/Saved Application State/com.allansargeant.livepremier-plus.savedState",
  ]
end
