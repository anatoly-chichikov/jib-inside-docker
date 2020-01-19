# JIB, Docker, Compose

Demo project shows how to build and run a modern Spring Boot application 
locally, having only a Docker on the machine and a cloned repository. 

## Start

Only the latest version of Docker (including Compose) is required for building 
and running. 

Simply execute it at the root of the project:
```
sh run.sh
```

## Step by step

All actions are defined in [run.sh](run.sh) file. Configuration of the Jib 
plugin can be found in root [pom.xml](pom.xml).

Inside the container with [Amazon Corretto 11](https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/what-is-corretto-11.html):
- mounting necessary directories for the sources, caches and results 
- project compiling with Maven
- creating Docker images of each application using 
[Jib](https://github.com/GoogleContainerTools/jib) as `.tar` files. 

Outside the docker:
- each `.tar` is loading into the **host** machine Docker daemon.
- executing [docker-compose.yml](docker-compose.yml).
- that's all

## Next steps

Here you can see an example of local launch only. For production environments 
the principle is similar, with the difference that Jib should be used directly 
to upload artifacts to your registry. 

To do this, you can use `jib:build` instead of `jib:buildTar`. After that 
run your regular CI pipeline and apply those images to k8s cluster or 
something similar.
