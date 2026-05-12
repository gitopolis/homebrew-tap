cask "konstantin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.3"
  sha256 arm:   "fdad5bb55057689ba393400505fc9885d7419096f845ffa4b758dc9eb1dbf5e7",
         intel: "7f15ced172cd765107fe7a99055f5a42a5a7cf27afe055017d23a9a283d0b41f"

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
