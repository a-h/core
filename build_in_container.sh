#/bin/bash

# http://www.hanselman.com/blog/ExploringASPNETCoreWithDockerInBothLinuxAndWindowsContainers.aspx
# https://blogs.msdn.microsoft.com/stevelasker/2016/09/29/building-optimized-docker-images-with-asp-net-core/

# DEBUG

# Build the current directory and push it to ./bin/Release/PublishOutput
docker run -it -v `pwd`/sln:/sln --workdir /sln microsoft/aspnetcore-build bash -c "dotnet restore && dotnet publish -c Release -o ./bin/Release/PublishOutput"

# Run the container with the output mounted.
docker run -it -p 8080:80 -v `pwd`/sln/bin/Release/PublishOutput:/app/bin:ro -v `pwd`/sln:/app:ro --workdir /app microsoft/aspnetcore bash -c "dotnet bin/sln.dll"