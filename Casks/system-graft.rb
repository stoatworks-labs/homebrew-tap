cask "system-graft" do
  version "0.2.2"
  sha256 "f47a283396042ff24ea43d3def63fc4c35998bf15aa89542c52e1f2761f8a28a"
  url "https://github.com/stoatworks-labs/system-graft/releases/download/v#{version}/system-graft-#{version}-macos-arm64.dmg",
      verified: "github.com/stoatworks-labs/system-graft/"

  name "System Graft"
  desc "Graft modules into an initrd"
  homepage "https://stoatworks-labs.com/software/system-graft/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "System Graft.app"
end
