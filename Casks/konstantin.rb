cask "konstantin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "8150b1af56aa9f09ca41e412901563e5e065a72a255b91a31e88140f2b258a56",
         intel: "639f829c3ce8a7ffeebdd809a3b439812a14fff089c015aa3a8b517ff892c40f"

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
