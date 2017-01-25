# dotNet Core System

An example of a dotNet Core Website, API and Library.

# Build Processes

## Mount code into a build container, build it with the output going to ./bin

```
docker run -it -v `pwd`:/sln --workdir /sln microsoft/aspnetcore-build sh build.sh
```

## Copy the contents into a smaller container to run it.

```
# Build container
cd Web
docker build -t core-container .
# Run final container, mapping 8080 on the local machine to 80 on the container.
docker run -p 8080:80 --rm -it core-container
```