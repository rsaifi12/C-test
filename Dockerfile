#  .NET Core SDK as the base image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

# Setting the working directory in the container
WORKDIR /app

# Copy the current directory contents to the container at /app
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Set the entry point and working directory for the runtime
WORKDIR /app/out
ENTRYPOINT ["dotnet", "Program.dll"]
