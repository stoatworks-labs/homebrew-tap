cask "showbook" do
  version "0.1.1"
  sha256 "9408040e34128fe870b556983c31752832e808551ac8f4114bb293213baee833"
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
