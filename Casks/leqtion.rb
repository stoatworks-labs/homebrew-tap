cask "leqtion" do
  version "0.1.1"

  on_arm do
    sha256 "4d7449dce9b1b625872162a1ef4cf8340441485e65c1a94f2a9c2244191a905b"
    url "https://github.com/stoatworks-labs/LEQtion/releases/download/v#{version}/leqtion-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "c7ef257af59e9d947244ac0d16fccb2f8d229f2ba5a7a572b6a0647ca91c7341"
    url "https://github.com/stoatworks-labs/LEQtion/releases/download/v#{version}/leqtion-#{version}-macos-x86_64.dmg"
  end

  name "LEQtion"
  desc "Sound level meter and dual-channel analyser"
  homepage "https://stoatworks-labs.com/software/leqtion/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "LEQtion.app"

  zap trash: [
    "~/Library/Application Support/LEQtion",
    "~/Library/Application Support/com.allansargeant.leqtion",
    "~/Library/Preferences/com.allansargeant.leqtion.plist",
    "~/Library/Saved Application State/com.allansargeant.leqtion.savedState",
  ]
end
