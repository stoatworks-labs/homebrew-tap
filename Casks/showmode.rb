cask "showmode" do
  version "0.4.0"
  sha256 "9d1326020a3a2646cbe058534618d80837654b3aba6a5cf1a79f1c29c5bcec49"

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
