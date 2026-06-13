cask "konstantin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.3"
  sha256 arm:   "9820c14ce20fa9cc37b5968307f475e9a264da0b627b4a628afc272295a6e3ca",
         intel: "66cf60c1d543126a3ce05e8985cda85fd1ae26b35bddad647b8de3668746b94a"

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
