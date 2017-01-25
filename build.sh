#/bin/bash
wd=$(pwd)

# Restore
cd $wd/Library/
dotnet restore
cd $wd/Web/
dotnet restore

# Build
dotnet build **/project.json

# Publish Web
cd $wd/Web/
dotnet publish -c Release -o ./bin/