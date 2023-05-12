# Usage

Copy this file on your repository:

```
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/alpine
{
	"name": "Alpine Docker in Docker",
	"image": "ghcr.io/jorgecar/codespace:main",
	"runArgs": ["--init", "--privileged"],
	"mounts": ["source=dind-var-lib-docker,target=/var/lib/docker,type=volume"],
	"overrideCommand": false,

    "customizations": {
        "vscode": {

            // Set *default* container specific settings.json values on container create.
            "settings": {},

            // Add the IDs of extensions you want installed when the container is created.
            "extensions": [
                "ms-azuretools.vscode-docker",
                "codingyu.laravel-goto-view",
                "amiralizadeh9480.laravel-extra-intellisense",
                "shufo.vscode-blade-formatter",
                "EditorConfig.EditorConfig",
                "mikestead.dotenv",
                "naoray.laravel-goto-components",
                "glitchbl.laravel-create-view",
                "IHunte.laravel-blade-wrapper",
                "cjhowe7.laravel-blade",
                "austenc.laravel-blade-spacer",
                "mohamedbenhida.laravel-intellisense",
                "ctf0.laravel-goto-controller",
                "georgykurian.laravel-ide-helper",
                "open-southeners.laravel-pint",
                "msamgan.laravel-pint-vscode",
                "bmewburn.vscode-intelephense-client",
                "MehediDracula.php-namespace-resolver"
            ]
        }
    },
	"remoteUser": "vscode",
	"onCreateCommand": "bash .devcontainer/commands/OnCreateCommand.sh"
}
```

# Authorization
Then you need allowing your codespace to access a private image registry. It is required to download the docker image built

1. Go to your `settings > secrets > codespaces`
2. Add the follow secrets:
- GHCR_CONTAINER_REGISTRY_PASSWORD: (generate token with `read:packages` access)
- GHCR_CONTAINER_REGISTRY_SERVER: ghcr.io
- GHCR_CONTAINER_REGISTRY_USER: your user name

# Required files
Copy the file `.devcontainer/commands/OnCreateCommand.sh` from this repository and paste it at the same path in your repository. 

In this file you can define any command that you need to get ready your codespace.
