cask "pdf-presenter" do
  version "1.7.3"
  sha256 "9c6a052d352f3564cd034f1aa9107ec5e8123dcaeb7f17ed1cce7d12dba3d8ef"

  url "https://github.com/stoatworks-labs/pdf-presenter/releases/download/v#{version}/pdf-presenter-#{version}-universal.dmg"
  name "PDF Presenter"
  desc "PDF presenter, and not much else"
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
