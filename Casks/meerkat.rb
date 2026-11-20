cask "meerkat" do
  version "0.2.0"
  sha256 "e326fb15472ef894ac35abf1da360fd9f905889005e5f42f8d7d26c291799a07"

  url "https://github.com/stoatworks-labs/meerkat/releases/download/v#{version}/Meerkat_#{version}_universal.dmg"
  name "Meerkat"
  desc "Find every PTZ camera on the network and set its address"
  homepage "https://stoatworks-labs.com/software/meerkat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Meerkat.app"
end
