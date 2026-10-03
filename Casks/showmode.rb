cask "showmode" do
  version "0.3.1"
  sha256 "00cabebae70c23dddf45a13d660ac2b05a2f8c521339a0e6bc645d537774ee04"

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
