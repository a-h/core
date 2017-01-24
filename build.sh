#/bin/bash
wd=$(pwd)

# Restore
cd $wd/Library/
dotnet restore
cd $wd/Web/
dotnet restore

# Build
dotnet build **/project.json