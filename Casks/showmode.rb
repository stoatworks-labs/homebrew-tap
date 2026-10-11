cask "showmode" do
  version "0.5.0"
  sha256 "dbd06bfaa181e8ef887358b5b6dc4578735d3577c85c87cf3c585335ae8fc9a1"

  url "https://github.com/stoatworks-labs/showmode/releases/download/v#{version}/showmode-#{version}-macos-universal.dmg"
  name "Show Mode"
  desc "One click to lock a machine down for a show"
  homepage "https://stoatworks-labs.com/software/showmode/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Show Mode.app"
end
