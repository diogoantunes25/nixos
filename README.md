# Nix\[OS] dotfiles

## Structure

- [`hosts`](./hosts): complete configuration for all hosts
- [`assets`](./assets): images, videos, sounds, ...
- [`lib`](./lib): nix code library
- [`modules`](./modules): NixOS modules
    - [`profiles`](./profiles): these can be thought of as roles that can be given to hosts/users
    - [`users`](./users): users for the different roles
    - [`pieces`](./users): configuration pieces
- [`overlays`](./overlays): TBA
- [`pkgs`](./pkgs): packages
- [`secrets`](./secrets): agenix secrets
- [`dotfiles`](./dotfiles): configuration files that can't be expressed through nix

## Updating NixOS config on host

If the host is the local one, the following command rebuilds the config and updates it:

```bash
sudo nixos-rebuild switch --flake <reporoot>/#<host>
```

If the host is remote, the way I like to do it is to locally build the config and only then deploy it

```bash
nixos-rebuild switch --flake <reporoot>/#<remote-host> --target-host root@<remote-host> --verbose
```

## Updating Home Manager config on host

If the host is the local one, the following command rebuilds the config and updates it:

```bash
home-manager switch --flake .#<user>@<host>
```

## Resources

- [NixOS 79: Flakes + Home Manager Multiuser/Multihost Configuration (Part 1)](https://www.youtube.com/watch?v=e8vzW5Y8Gzg)
- In the case you care, here are [My two cents on NixOS](link).
- [Remote deployments](https://nixos-and-flakes.thiscute.world/best-practices/remote-deployment)

## Other NixOS repos I used

- [Carlos Vaz](https://github.com/carjorvaz/nixos)
- [Andre Breda](https://github.com/abread/nixconfig)
- [RNL](https://gitlab.rnl.tecnico.ulisboa.pt/rnl/nixrnl)
- [Keenan's Nix config](https://github.com/keenanweaver/nix-config)
