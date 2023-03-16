# Valgrind for MacOS using docker!

*Based on
[article](https://medium.com/@massey0ross/valgrind-in-macos-with-docker-3b0e4bbdece1)*

## Usage

Using this is a three step process, building image, setting alias and running
valgrind in a docker container.

### Building the image

In the directory where the
[Dockerfile](https://docs.docker.com/engine/reference/builder/) is contained
run the command:

```bash
docker build -t valgrind:1.0 .
```

This will create a docker image based on the lightweight
[alpine-linux](https://hub.docker.com/_/alpine) distribution, with valgrind and
g++ installed.

### Setting up the alias

A shell script for doing this is located in [set_alias.sh](./set_alias.sh).

To not have to re-run the script for each session, copy the line:

```bash
alias valgrind='docker run -it --rm -v $PWD:/code valgrind:1.0'
```

into you .zshrc.

### Running valgrind

What remains is to compile the source code and execute valgrind on the binary.
Now you can use the alias we set in the previous step to execute valgrind:

```bash
valgrind /bin/sh -c "gcc main.c; valgrind [options] ./a.out; rm ./a.out"
```

#### Using make

[Make](https://www.gnu.org/software/make/) is also installed into the image,
therefore using make will also work.

```bash
valgrind /bin/sh -c "make; valgrind [options] [output-file]; rm [output-file]"
```

## Example

Test the code on the example memory leak file [example/main.c](example/main.c)
(from [valgrind
quickstart](https://valgrind.org/docs/manual/quick-start.html)):

Find the code:

```bash
cd example
```

Test the program:

```bash
valgrind /bin/sh -c "gcc main.c; valgrind --leak-check=full \
--show-leak-kinds=all --track-origins=yes --verbose ./a.out; rm ./a.out"
```

The output will show the memory leaks, refer to
[quickstart](https://valgrind.org/docs/manual/quick-start.html) for further
explanations of the memory-leaks.
