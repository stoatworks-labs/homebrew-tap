cask "system-graft" do
  version "0.2.3"
  sha256 "453772428f77cde7964a9729706a7ba1a9f93e8b9d69e95a3b165133c532b291"
  url "https://github.com/stoatworks-labs/system-graft/releases/download/v#{version}/system-graft-#{version}-macos-universal.dmg"

  name "System Graft"
  desc "Graft modules into an initrd"
  homepage "https://stoatworks-labs.com/software/system-graft/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "System Graft.app"
end
