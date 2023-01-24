# Use the official CentOS image as the base image
FROM centos:latest

# Update the package manager and install Node.js 14.15
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs

# Copy the application files into the container
COPY . /app

# Set the working directory
WORKDIR /app


