# GitHub Codespace with OpenROAD GUI

The goal is to provide a web browser experience of the OpenROAD GUI. Solution works with Firefox and Chrome.

First time Codespace users are encouraged to read the tutorial [creating a codespace for a repository](https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository).

## User

1. Create a codespace from this repository.

![create](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/create_codespace.gif)

2. Select `ubuntu gui` in the `Dev container configuration` field

![configure](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/configure_codespace.gif)

3. Connect to the generated codespace
4. At the bottom, there should be tab `PORTS`, where you will find the `Forwarded Address`. Follow this link to connect to NoVNC

![open](https://github.com/antmicro/openroad-codespace/blob/mczyz/dev/img/open_vnc.gif)

5. NoVNC tab should open - default password is `vscode`.
6. Right-click on desktop and open Terminal and execute the following commands to run OpenROAD GUI

```
cd /OpenROAD-flow-scripts/flow
. ../env.sh
make
make gui_final
```

### VSCode

1. You can also use VSCode to connect to Codespaces
2. [Install VSCode](https://code.visualstudio.com/docs/setup/setup-overview).
3. Open VSCode and install the [GitHub Codespaces](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces) extension
4. Press `Ctrl+Shift+P` and select `Codespaces:Connect to Codespace`
5. Open a web browser and connect to url: `localhost:6080`.

## Developer

OpenROAD Flow Scripts provide a docker image generation script `etc/DockerHelper.sh`, which is used here to build and publish the image to GH registry.

Useful resources:
* [Development loop](https://code.visualstudio.com/docs/devcontainers/create-dev-container#_full-configuration-edit-loop)
* [devcontainer JSON reference](https://containers.dev/implementors/json_reference/)
* [Desktop lite feature](https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/desktop-lite.md)
