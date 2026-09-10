cask "pdf-presenter" do
  version "1.7.0"
  sha256 "bfa21c2c40cbb502eb124bf4ae7485f30d09490572e37f4240d52d8a68f68c30"
  url "https://github.com/stoatworks-labs/pdf-presenter/releases/download/v#{version}/pdf-presenter-#{version}-universal.dmg",
      verified: "github.com/stoatworks-labs/pdf-presenter/"

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
