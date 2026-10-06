cask "leqtion" do
  version "0.1.3"

  on_arm do
    sha256 "aede87301e784bc5cc09eb76a4e4f2d66b7da7152a8fad6beb739a38f9bb1f61"

    url "https://github.com/stoatworks-labs/LEQtion/releases/download/v#{version}/leqtion-#{version}-macos-aarch64.dmg"
  end
  on_intel do
    sha256 "67c49fbdae0ae410b25b48bd988d54aeed81973f09f0c7eecb0eb9c46c37dd50"

    url "https://github.com/stoatworks-labs/LEQtion/releases/download/v#{version}/leqtion-#{version}-macos-x86_64.dmg"
  end

  name "LEQtion"
  desc "Sound level meter and dual-channel analyser"
  homepage "https://stoatworks-labs.com/software/leqtion/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "LEQtion.app"

  zap trash: [
    "~/Library/Application Support/com.allansargeant.leqtion",
    "~/Library/Application Support/LEQtion",
    "~/Library/Preferences/com.allansargeant.leqtion.plist",
    "~/Library/Saved Application State/com.allansargeant.leqtion.savedState",
  ]
end
