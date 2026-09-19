cask "showbook" do
  version "0.1.0"
  sha256 "b7d820449173223505f92768e6ee16dafb68dd23d5c48989448ea4cc2a049571"
  url "https://github.com/stoatworks-labs/showbook/releases/download/v#{version}/Showbook_#{version}_universal.dmg"

  name "Showbook"
  desc "Every show file for your switchers, with its history"
  homepage "https://stoatworks-labs.com/software/showbook/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "Showbook.app"
end
