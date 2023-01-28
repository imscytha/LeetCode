# Helper Scripts

[**`build.sh`**](#buildsh) and [**`symlink.sh`**](#symlinksh) are helper scripts that I wrote to simplify compiling, running and demonstrating use case solutions from this repository, or perhaps solutions you have written yourself.

The reason behind doing this, is to avoid running resource intensive IDE's such as Eclipse, IntelliJ, etc.

This allows extensibility on customizing the build process by modifying the scripts according to each needs, and saves resources for just running simple implementations of the LeetCode problems considering that the solutions are written in single functions.

However, shall you run on problems or prefer testing or writing your solutions on your own IDE, you're not limited to the use of only these scripts.

#### Requirements

As of currently I'm writting my solutions in Java, therefore this build script supports only Java.

- `java` installed and have all it's corresponding binaries accessible in `$PATH` (e.g `javac`, `jar`, `jdeps`, etc.)

### [build.sh](build.sh)

Is the script supposed to compile and run the solutions which in this repository the appropriate files are stored in `src`.

If no arguments are supplied, first the script checks if you have java installed in your system, then it creates a directory named `build` inside the current working directory.
After this, it tries to detect the file `Main.java`, which is supposed to have the class supplied with the `main()` method from which the solutions can be compiled, with the corresponding `.class` files ending up in `build`. To run the compiled binaries, you can supply the argument `run` to the script like this:

```bash
./build.sh run
```

If you want to remove the compiled java binaries you can supply the argument `clean`:

```bash
./build.sh clean
```

```
Usage:  build.sh [COMMAND] [OPTIONS]

command:
  run       run the compiled project
  clean     clean the project (delete java binaries and build files)

options:
  --help | -h     show this help text
```

### [symlink.sh](symlink.sh)

Creates symbolic links of `build.sh` in all the subdirectories of the corresponding problems, so that you access the `build.sh` script to compile and run solutions.

To achieve that you can simply run the script without any arguments.

```bash
./symlink.sh
```

If you want to remove the links, you just supply the argument `rm` to the script like this

```bash
./symlink.sh rm
```

```
Usage:  symlink.sh [COMMAND] [OPTIONS]

command:
  rm    remove the symbolic links of build.sh in all subdirectories

options:
  --help | -h    show this help text
```

> **Warning** _Caution if you change the path of the script files._
>
> _Considering that we're dealing with symbolic links you can end up with missmatched paths, thats why you need to update the old path of the links so that it points to the new correct path. Unless you know what you're doing, it is advised that the scripts be run as supplied in this repository_.
