#/bin/bash
wd=$(pwd)

# Restore
cd $wd/Library/
dotnet restore
cd $wd/Web/
dotnet restore

# Build
dotnet build **/project.json

# Publish
dotnet publish -c Release -o ./bin/Release/PublishOutput