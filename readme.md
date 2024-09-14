# pigeon devcontainer

it's pigeon's devcontainer base... you probably don't want to use this.

if for some reason you *do*, try something like this:

```json
{
  "image": "ghcr.io/backwardspy/devcontainer:latest",
  // add whichever features you need
  "features": {
    "ghcr.io/devcontainers/features/python:1": {
      "version": "3.12",
      "installTools": false
    },
    "ghcr.io/devcontainers-contrib/features/poetry:2": {}
  },
  // the image includes fish shell
  "customizations": {
    "vscode": {
      "settings": {
        "terminal.integrated.defaultProfile.linux": "fish"
      },
    }
  }
}
```