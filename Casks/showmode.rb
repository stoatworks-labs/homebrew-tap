cask "showmode" do
  version "0.2.0"
  sha256 "9a4893dc83b9553c64a4a73042e028b022df75264b8f2670b7e2deaaf75d97d0"
  url "https://github.com/stoatworks-labs/showmode/releases/download/v#{version}/showmode-#{version}-macos-universal.dmg"

  name "Show Mode"
  desc "One click to lock a Mac down for a show"
  homepage "https://stoatworks-labs.com/software/showmode/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Show Mode.app"
end
