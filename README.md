# homebrew-konstantin

Homebrew tap for [Konstantin](https://github.com/gitopolis/konstantin),
a macOS screen-time enforcer.

## Install

```sh
brew tap gitopolis/konstantin
brew install --cask konstantin
```

The cask installs `Konstantin.app` into `/Applications`. On first launch
the app will prompt for an admin password to install its privileged
LaunchDaemon.

## Uninstall

```sh
brew uninstall --cask konstantin            # leaves /etc/screentimed/ config
brew uninstall --cask --zap konstantin      # also removes config + state
```

## Apple Silicon only

The cask currently ships an `arm64` build only. Intel Mac support may
be added later via a matrix expansion in the upstream release workflow.

## Updating the cask (maintainers)

After an upstream release publishes a new
`Konstantin-<version>-arm64.zip` asset:

1. Bump `version` in `Casks/konstantin.rb`.
2. Compute the SHA-256 of the released zip and replace `:no_check`:

   ```sh
   curl -fsSL "https://github.com/gitopolis/konstantin/releases/download/v<version>/Konstantin-<version>-arm64.zip" \
     | shasum -a 256
   ```

3. Commit and push.

This is intended to be automated by a workflow in the main repo that
opens a PR here on each release.
