cask "pdf-presenter" do
  version "1.7.1"
  sha256 "336ece1f5b76c3870be76b1479099c397a646bbe9e7b41b3a0b8209fd88ea91e"
  url "https://github.com/stoatworks-labs/pdf-presenter/releases/download/v#{version}/pdf-presenter-#{version}-universal.dmg"

  name "PDF Presenter"
  desc "Minimal PDF presenter"
  homepage "https://stoatworks-labs.com/software/pdf-presenter/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "PDF Presenter.app"

  zap trash: [
    "~/Library/Application Support/PDF Presenter",
    "~/Library/Application Support/com.allansargeant.pdf-presenter",
    "~/Library/Preferences/com.allansargeant.pdf-presenter.plist",
    "~/Library/Saved Application State/com.allansargeant.pdf-presenter.savedState",
  ]
end
