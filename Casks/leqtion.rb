cask "leqtion" do
  version "0.1.2"

  on_arm do
    sha256 "0577c9967d7f25c66e34858d410cc59bd6b21a8a3876af72e731e36e2c149399"
    url "https://github.com/stoatworks-labs/LEQtion/releases/download/v#{version}/leqtion-#{version}-macos-aarch64.dmg"
  end

  on_intel do
    sha256 "ea2a4efb84d34d8c6feafc864d802021902bdced088ec266f7ce8a2ff0df8a4f"
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
