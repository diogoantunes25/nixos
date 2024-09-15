# Structure

This file describes very high-level organization of the configuration. The purpose
is not detailed documentation (that should be done along with the code), but rather
an aid in where to look at.

As one would expect, the "entrypoint" is [`flake.nix`](../flake.nix).

## `users`

User specific configuration

## `hosts`

Host specific configuration.

## `pkgs`

Definitions of packages that are not in `nixpkgs`.

## `lib`

Helper stuff.

## `profiles`

something you either have or you don't
not super intuitive to me, might change this is the future.

## `overlays`

(not surprinsingly) Overlays

## `secrets`

self-explanatory

## `config`

Don't know
