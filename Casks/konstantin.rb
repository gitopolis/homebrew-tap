cask "konstantin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "4d946b90242eece8750481e91eb773c4bb5e960b44e9d27598fcc309ccb53c52",
         intel: "7dbe1457555d2728b51559e90960832829ddb2258478ac4245f8b6ff26251f03"

  url "https://github.com/gitopolis/konstantin/releases/download/v#{version}/Konstantin-#{version}-#{arch}.zip"
  name "Konstantin"
  desc "macOS screen-time enforcer"
  homepage "https://github.com/gitopolis/konstantin"

  depends_on macos: ">= :ventura"

  app "Konstantin.app"

  uninstall launchctl: "com.gitopolis.screentimed",
            delete: [
              "/usr/local/libexec/screentimed",
              "/usr/local/bin/konstantin-status",
              "/usr/local/bin/konstantin-tray",
              "/Library/LaunchDaemons/com.gitopolis.screentimed.plist",
              "/Library/LaunchAgents/com.gitopolis.konstantin-tray.plist",
              "/var/run/screentimed.sock",
              "/var/db/screentimed",
            ]

  zap trash: [
        "~/Library/LaunchAgents/com.gitopolis.konstantin-tray.plist",
      ],
      delete: [
        "/etc/screentimed",
        "/var/db/screentimed",
        "/var/log/screentimed.log",
      ]
end
