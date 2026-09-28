cask "showmode" do
  version "0.1.0"
  sha256 "b192b9864f2b2ce98fb819424a37079808d26e4a8f4dfcdad0b611dd5eebdb73"
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
