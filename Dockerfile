# Get the base Ubuntu image from Docker Hub
FROM ubuntu:latest
 
# Update apps on the base image
RUN apt-get -y update && apt-get install -y build-essential cmake

LABEL Name=cidemo Version=0.0.1

# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/cidemo
 
# Specify the working directory
WORKDIR /usr/src/cidemo
 
# Use GCC to compile the Test.cpp source file
RUN cmake . && make
 
# Run the program output from the previous step
CMD ["./helloworlddocker"]