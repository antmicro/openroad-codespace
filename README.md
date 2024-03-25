# GitHub Codespace with OpenROAD GUI

The goal is to provide a web browser experience of the OpenROAD GUI. Solution works with Firefox and Chrome.

## Creating a Codespace

First time Codespace users are encouraged to read the tutorial [creating a codespace for a repository](https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository)

1. Create a codespace from this repository

![create](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/create_codespace.gif)

2. Select `ubuntu gui` in the `Dev container configuration` field

![configure](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/configure_codespace.gif)

3. Click "Create codespace" and after a few minutes, the codespace should be ready for use

## Using the Codespace

### OpenROAD GUI

1. At the bottom, there should be tab `PORTS`, where you will find the `Forwarded Address`. A link is provided, which you can follow to open the OpenROAD GUI

![open](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/open_vnc.gif)

2. NoVNC tab should open - default password is `vscode`
3. Right-click on desktop and open Terminal and execute the following commands to run OpenROAD GUI

```
cd ~/OpenROAD-flow-scripts/flow
. ../env.sh
make
make gui_final
```

### Useful scripts

You can change the resolution with script:

```
/usr/local/bin/set-resolution
```

Desktop initialization is performed in:

```
/usr/local/share/desktop-init.sh
```

## VSCode

1. You can also use VSCode to connect to Codespaces
2. [Install VSCode](https://code.visualstudio.com/docs/setup/setup-overview)
3. Open VSCode and install the [GitHub Codespaces](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces) extension
4. Press `Ctrl+Shift+P` and select `Codespaces:Connect to Codespace`
5. Open a web browser and connect to url: `localhost:6080`

## Developer

ORFS docker images is now built with available binaries. In CI configuration, you will find steps to reproduce the required docker images.

Useful resources:
* [Development loop](https://code.visualstudio.com/docs/devcontainers/create-dev-container#_full-configuration-edit-loop)
* [devcontainer JSON reference](https://containers.dev/implementors/json_reference/)
* [Desktop lite feature](https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/desktop-lite.md)

### Desktop-lite feature

The desktop-lite feature is provided by the [devcontainers organization](https://github.com/devcontainers/features/tree/main/src/desktop-lite). In this repo, a modified version of the feature is used via the [TODO-link] script.

### Restarting the graphical environment

This repository provides a crude `scripts/kill.sh` script to terminate all processes related to vnc. If you want to restart the vnc environment, first kill proceses, then re-lanuch by executing `/usr/local/share/desktop-init.sh`
