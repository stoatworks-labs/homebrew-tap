cask "showbook" do
  version "0.2.0"
  sha256 "63804bae06318062028ecbdb6127d4af3600a841ebe2e31bfed4e07626fa331c"

  url "https://github.com/stoatworks-labs/showbook/releases/download/v#{version}/Showbook_#{version}_universal.dmg"
  name "Showbook"
  desc "Every show file for your switchers, with its history"
  homepage "https://stoatworks-labs.com/software/showbook/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Showbook.app"
end
