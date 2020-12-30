Install Nix if you haven't already:

# user must be in sudoers

curl -L https://nixos.org/nix/install | sh

# Run this or login again to use Nix

. "\$HOME/.nix-profile/etc/profile.d/nix.sh"
Then install dapptools:

curl https://dapp.tools/install | sh
Installing custom solc versions
You can specify a custom solc version to run within dapp with dapp --use solc:x.y.z test, but you can also install any supported solc "standalone" (i.e. add it to your \$PATH) with:

nix-env -iA solc-versions.solc_x_y_z \
 -if https://github.com/dapphub/dapptools/tarball/master
