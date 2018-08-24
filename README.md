This image allows you to run a self-compiled version of bitcoind using the [Bitcoin Core Git repository](https://github.com/bitcoin/bitcoin). This way you don't have to rely on the PPA.

### Compilation
Packages and files that are only needed for compilation will be removed and thus not take up space in the final image. Please note that during image creation/compilation more than 1GB of RAM is used and the container uses around 2GB in disk size. The final image however is much smaller (~200MB). Tests and benchmark will not be compiled. The wallet will be compiled (using BerkeleyDB 4.8) but can be disabled by adding `disablewallet=1` to the `bitcoin.conf` file.

### Volumes ###
The Bitcoin data directory is set to `/bitcoin`. Make sure to set permissions for the UID 999 and GID 999 which is the bitcoin user internally. The `bitcoin.conf` file must be mounted in `/bitcoin/bitcoin.conf`. If you want to use `bitcoin-cli` within the container make sure to add another `bitcoin.conf` to the bitcoin home directory `/home/bitcoin/.bitcoin/bitcoin.conf` containing the same `rpcuser` and `rpcpassword` defined in the main `bitcoin.conf` file.
