**Failed** attempt to build [CoreCLR](https://github.com/dotnet/coreclr) on [Arch Linux](https://www.archlinux.org/). **I'm looking for help to get it working!**

# Build

Inside an existing x64 Arch Linux machine type:

```
make
```

This will create a fresh Arch Linux docker image named `archlinux`, then it will build the `master` version of CoreCLR inside a docker container.

**NB** After I'm able to do a successful build the intent is to create a proper [Arch Linux package](https://wiki.archlinux.org/index.php/Creating_packages) for CoreCLR.


# archlinux base docker image

The `mkimage-arch.sh` and `mkimage-arch-pacman.conf` scripts used to build the fresh Arch Linux docker image originate from the oficial [Docker repo](https://github.com/docker/docker/tree/master/contrib).
