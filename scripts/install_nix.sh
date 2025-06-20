# install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# setup home-manager
nix run home-manager/master -- init --switch

# cp home.nix
echo "See home.nix in $HOME/me/scripts/home.nix"
