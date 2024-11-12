# shell profile

```bash
cd ~
echo '[ -f "$HOME/me/.profile.sh" ] && source "$HOME/me/.profile.sh"' >> ~/.bashrc
git clone https://github.com/kevinfiol/shell.git me
```

## setting up nix + home-manager
From [zero-to-nix](https://zero-to-nix.com/start/install)
```bash
# install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# setup home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# use unstable channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
```
