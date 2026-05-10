cask "konstantin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "b8a5a0c4bd76d982b7d8889001ebf4c1061b1cba8bcbabbff72d0b285a9b8cf5",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

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
