cask "showmode" do
  version "0.6.0"
  sha256 "618321eef1667810fee325840a414e2142ead6814c113cd3c8c3cb98b14fa523"

  url "https://github.com/stoatworks-labs/showmode/releases/download/v#{version}/showmode-#{version}-macos-universal.dmg"
  name "Show Mode"
  desc "Stops your show Mac embarrassing you mid-show"
  homepage "https://stoatworks-labs.com/software/showmode/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Show Mode.app"
end
