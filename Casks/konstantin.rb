cask "konstantin" do
  version "0.2.0"
  sha256 "2c1280bfc8118c839cfe14b982530542cd739a700ac224d6eecd43f16e51a8d2"

  on_arm do
    url "https://github.com/gitopolis/konstantin/releases/download/v#{version}/Konstantin-#{version}-arm64.zip"
  end

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
