from alpine:latest

# Add valgrind and g++
run apk add g++ valgrind make

# Set working directory
workdir /code
