cask "pdf-presenter" do
  version "1.7.2"
  sha256 "6342ba6f78732adeda98c8b5edd748104cec7d4c5228a558bc004456a9591618"

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
    "~/Library/Application Support/com.allansargeant.pdf-presenter",
    "~/Library/Application Support/PDF Presenter",
    "~/Library/Preferences/com.allansargeant.pdf-presenter.plist",
    "~/Library/Saved Application State/com.allansargeant.pdf-presenter.savedState",
  ]
end
