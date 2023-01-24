# Use the official CentOS image as the base image
FROM centos:latest

# Update the package manager and install Node.js 14.15
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - && yum install -y nodejs-14.15.0
RUN yum install -y nodejs

# Copy the application files into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install the application dependencies
RUN npm install

# Expose the port that the application will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
