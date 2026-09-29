cask "showmode" do
  version "0.3.0"
  sha256 "522e2229f13476c27f3f6fce6efebd231c6e69c63b7eca49e293c65b411cd23c"
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
