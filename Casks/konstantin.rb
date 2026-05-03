cask "konstantin" do
  version "0.2.1-rc1"
  sha256 "6931e2ab683371ba4a880e98eff87f88db9cba684424593a7b17d72af71e3a78"

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
