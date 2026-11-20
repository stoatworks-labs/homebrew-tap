cask "meerkat" do
  version "0.1.0"
  sha256 "ec6952b3db62b4d12b92ffa4ba85a1c1e57005dace6c59c4cc7edeab6bff8881"

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
